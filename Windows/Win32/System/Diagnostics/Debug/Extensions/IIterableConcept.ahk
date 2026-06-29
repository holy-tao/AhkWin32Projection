#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelIterator.ahk" { IModelIterator }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IIterableConcept extends IUnknown {
    /**
     * The interface identifier for IIterableConcept
     * @type {Guid}
     */
    static IID := Guid("{f5d49d0c-0b02-4301-9c9b-b3a6037628f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIterableConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDefaultIndexDimensionality : IntPtr
        GetIterator                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIterableConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {Integer} 
     */
    GetDefaultIndexDimensionality(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", &dimensionality := 0, "HRESULT")
        return dimensionality
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IModelIterator} 
     */
    GetIterator(contextObject) {
        result := ComCall(4, this, "ptr", contextObject, "ptr*", &iterator := 0, "HRESULT")
        return IModelIterator(iterator)
    }

    Query(iid) {
        if (IIterableConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDefaultIndexDimensionality := CallbackCreate(GetMethod(implObj, "GetDefaultIndexDimensionality"), flags, 3)
        this.vtbl.GetIterator := CallbackCreate(GetMethod(implObj, "GetIterator"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDefaultIndexDimensionality)
        CallbackFree(this.vtbl.GetIterator)
    }
}
