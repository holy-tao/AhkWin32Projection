#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateInstaller2.ahk" { IUpdateInstaller2 }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Installs or uninstalls updates on a computer. (IUpdateInstaller3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateinstaller3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateInstaller3 extends IUpdateInstaller2 {
    /**
     * The interface identifier for IUpdateInstaller3
     * @type {Guid}
     */
    static IID := Guid("{16d11c35-099a-48d0-8338-5fae64047f8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateInstaller3 interfaces
    */
    struct Vtbl extends IUpdateInstaller2.Vtbl {
        get_AttemptCloseAppsIfNecessary : IntPtr
        put_AttemptCloseAppsIfNecessary : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateInstaller3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AttemptCloseAppsIfNecessary {
        get => this.get_AttemptCloseAppsIfNecessary()
        set => this.put_AttemptCloseAppsIfNecessary(value)
    }

    /**
     * Gets a value indicating whether the update installer will attempt to close applications, blocking immediate installation of updates.
     * @returns {VARIANT_BOOL} True if the installer will attempt to close applications.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller3-get_attemptcloseappsifnecessary
     */
    get_AttemptCloseAppsIfNecessary() {
        result := ComCall(30, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Sets a value indicating whether the update installer will attempt to close applications, blocking immediate installation of updates.
     * @param {VARIANT_BOOL} value Set to True if the installer should attempt to close applications.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller3-put_attemptcloseappsifnecessary
     */
    put_AttemptCloseAppsIfNecessary(value) {
        result := ComCall(31, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateInstaller3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AttemptCloseAppsIfNecessary := CallbackCreate(GetMethod(implObj, "get_AttemptCloseAppsIfNecessary"), flags, 2)
        this.vtbl.put_AttemptCloseAppsIfNecessary := CallbackCreate(GetMethod(implObj, "put_AttemptCloseAppsIfNecessary"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AttemptCloseAppsIfNecessary)
        CallbackFree(this.vtbl.put_AttemptCloseAppsIfNecessary)
    }
}
