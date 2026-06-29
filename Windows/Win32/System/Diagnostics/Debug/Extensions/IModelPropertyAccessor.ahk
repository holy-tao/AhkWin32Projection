#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IModelPropertyAccessor extends IUnknown {
    /**
     * The interface identifier for IModelPropertyAccessor
     * @type {Guid}
     */
    static IID := Guid("{5a0c63d9-0526-42b8-960c-9516a3254c85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModelPropertyAccessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValue : IntPtr
        SetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModelPropertyAccessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @returns {IModelObject} 
     */
    GetValue(key, contextObject) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, "ptr", contextObject, "ptr*", &value := 0, "HRESULT")
        return IModelObject(value)
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} value 
     * @returns {HRESULT} 
     */
    SetValue(key, contextObject, value) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", contextObject, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IModelPropertyAccessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 4)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.SetValue)
    }
}
