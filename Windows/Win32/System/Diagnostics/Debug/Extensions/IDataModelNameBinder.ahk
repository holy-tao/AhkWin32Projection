#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKeyEnumerator.ahk" { IKeyEnumerator }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelNameBinder extends IUnknown {
    /**
     * The interface identifier for IDataModelNameBinder
     * @type {Guid}
     */
    static IID := Guid("{af352b7b-8292-4c01-b360-2dc3696c65e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelNameBinder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BindValue           : IntPtr
        BindReference       : IntPtr
        EnumerateValues     : IntPtr
        EnumerateReferences : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelNameBinder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} value 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindValue(contextObject, name, value, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", contextObject, "ptr", name, IModelObject.Ptr, value, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} _reference 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindReference(contextObject, name, _reference, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", contextObject, "ptr", name, IModelObject.Ptr, _reference, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateValues(contextObject) {
        result := ComCall(5, this, "ptr", contextObject, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateReferences(contextObject) {
        result := ComCall(6, this, "ptr", contextObject, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    Query(iid) {
        if (IDataModelNameBinder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindValue := CallbackCreate(GetMethod(implObj, "BindValue"), flags, 5)
        this.vtbl.BindReference := CallbackCreate(GetMethod(implObj, "BindReference"), flags, 5)
        this.vtbl.EnumerateValues := CallbackCreate(GetMethod(implObj, "EnumerateValues"), flags, 3)
        this.vtbl.EnumerateReferences := CallbackCreate(GetMethod(implObj, "EnumerateReferences"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindValue)
        CallbackFree(this.vtbl.BindReference)
        CallbackFree(this.vtbl.EnumerateValues)
        CallbackFree(this.vtbl.EnumerateReferences)
    }
}
