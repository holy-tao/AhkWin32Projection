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
export default struct IKeyStore extends IUnknown {
    /**
     * The interface identifier for IKeyStore
     * @type {Guid}
     */
    static IID := Guid("{0fc7557d-401d-4fca-9365-da1e9850697c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKeyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetKey      : IntPtr
        SetKey      : IntPtr
        GetKeyValue : IntPtr
        SetKeyValue : IntPtr
        ClearKeys   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKeyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", _object, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(5, this, "ptr", key, IModelObject.Ptr, _object, IKeyStore.Ptr, metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, _object) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(6, this, "ptr", key, "ptr", _object, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearKeys() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKeyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetKey := CallbackCreate(GetMethod(implObj, "GetKey"), flags, 4)
        this.vtbl.SetKey := CallbackCreate(GetMethod(implObj, "SetKey"), flags, 4)
        this.vtbl.GetKeyValue := CallbackCreate(GetMethod(implObj, "GetKeyValue"), flags, 4)
        this.vtbl.SetKeyValue := CallbackCreate(GetMethod(implObj, "SetKeyValue"), flags, 3)
        this.vtbl.ClearKeys := CallbackCreate(GetMethod(implObj, "ClearKeys"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetKey)
        CallbackFree(this.vtbl.SetKey)
        CallbackFree(this.vtbl.GetKeyValue)
        CallbackFree(this.vtbl.SetKeyValue)
        CallbackFree(this.vtbl.ClearKeys)
    }
}
