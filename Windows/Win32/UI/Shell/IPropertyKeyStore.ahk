#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPropertyKeyStore extends IUnknown {
    /**
     * The interface identifier for IPropertyKeyStore
     * @type {Guid}
     */
    static IID := Guid("{75bd59aa-f23b-4963-aba4-0b355752a91b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyKeyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetKeyCount  : IntPtr
        GetKeyAt     : IntPtr
        AppendKey    : IntPtr
        DeleteKey    : IntPtr
        IsKeyInStore : IntPtr
        RemoveKey    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyKeyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetKeyCount() {
        result := ComCall(3, this, "int*", &keyCount := 0, "HRESULT")
        return keyCount
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {PROPERTYKEY} 
     */
    GetKeyAt(index) {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, "int", index, PROPERTYKEY.Ptr, pkey, "HRESULT")
        return pkey
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    AppendKey(key) {
        result := ComCall(5, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteKey(index) {
        result := ComCall(6, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    IsKeyInStore(key) {
        result := ComCall(7, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    RemoveKey(key) {
        result := ComCall(8, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyKeyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetKeyCount := CallbackCreate(GetMethod(implObj, "GetKeyCount"), flags, 2)
        this.vtbl.GetKeyAt := CallbackCreate(GetMethod(implObj, "GetKeyAt"), flags, 3)
        this.vtbl.AppendKey := CallbackCreate(GetMethod(implObj, "AppendKey"), flags, 2)
        this.vtbl.DeleteKey := CallbackCreate(GetMethod(implObj, "DeleteKey"), flags, 2)
        this.vtbl.IsKeyInStore := CallbackCreate(GetMethod(implObj, "IsKeyInStore"), flags, 2)
        this.vtbl.RemoveKey := CallbackCreate(GetMethod(implObj, "RemoveKey"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetKeyCount)
        CallbackFree(this.vtbl.GetKeyAt)
        CallbackFree(this.vtbl.AppendKey)
        CallbackFree(this.vtbl.DeleteKey)
        CallbackFree(this.vtbl.IsKeyInStore)
        CallbackFree(this.vtbl.RemoveKey)
    }
}
