#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IIndexableConcept extends IUnknown {
    /**
     * The interface identifier for IIndexableConcept
     * @type {Guid}
     */
    static IID := Guid("{d1fad99f-3f53-4457-850c-8051df2d3fb5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIndexableConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDimensionality : IntPtr
        GetAt             : IntPtr
        SetAt             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIndexableConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {Integer} 
     */
    GetDimensionality(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", &dimensionality := 0, "HRESULT")
        return dimensionality
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetAt(contextObject, indexerCount, indexers, _object, metadata) {
        result := ComCall(4, this, "ptr", contextObject, "uint", indexerCount, IModelObject.Ptr, indexers, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {IModelObject} value 
     * @returns {HRESULT} 
     */
    SetAt(contextObject, indexerCount, indexers, value) {
        result := ComCall(5, this, "ptr", contextObject, "uint", indexerCount, IModelObject.Ptr, indexers, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIndexableConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDimensionality := CallbackCreate(GetMethod(implObj, "GetDimensionality"), flags, 3)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 6)
        this.vtbl.SetAt := CallbackCreate(GetMethod(implObj, "SetAt"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDimensionality)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.SetAt)
    }
}
