#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnhancedStorageACT2.ahk" { IEnhancedStorageACT2 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct IEnhancedStorageACT3 extends IEnhancedStorageACT2 {
    /**
     * The interface identifier for IEnhancedStorageACT3
     * @type {Guid}
     */
    static IID := Guid("{022150a1-113d-11df-bb61-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnhancedStorageACT3 interfaces
    */
    struct Vtbl extends IEnhancedStorageACT2.Vtbl {
        UnauthorizeEx      : IntPtr
        IsQueueFrozen      : IntPtr
        GetShellExtSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnhancedStorageACT3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    UnauthorizeEx(dwFlags) {
        result := ComCall(11, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsQueueFrozen() {
        result := ComCall(12, this, BOOL.Ptr, &pIsQueueFrozen := 0, "HRESULT")
        return pIsQueueFrozen
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetShellExtSupport() {
        result := ComCall(13, this, BOOL.Ptr, &pShellExtSupport := 0, "HRESULT")
        return pShellExtSupport
    }

    Query(iid) {
        if (IEnhancedStorageACT3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnauthorizeEx := CallbackCreate(GetMethod(implObj, "UnauthorizeEx"), flags, 2)
        this.vtbl.IsQueueFrozen := CallbackCreate(GetMethod(implObj, "IsQueueFrozen"), flags, 2)
        this.vtbl.GetShellExtSupport := CallbackCreate(GetMethod(implObj, "GetShellExtSupport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnauthorizeEx)
        CallbackFree(this.vtbl.IsQueueFrozen)
        CallbackFree(this.vtbl.GetShellExtSupport)
    }
}
