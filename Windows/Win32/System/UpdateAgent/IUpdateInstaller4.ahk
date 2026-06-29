#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateInstaller3.ahk" { IUpdateInstaller3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods to finalize updates that were previously staged or installed.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateinstaller4
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateInstaller4 extends IUpdateInstaller3 {
    /**
     * The interface identifier for IUpdateInstaller4
     * @type {Guid}
     */
    static IID := Guid("{ef8208ea-2304-492d-9109-23813b0958e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateInstaller4 interfaces
    */
    struct Vtbl extends IUpdateInstaller3.Vtbl {
        Commit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateInstaller4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Finalizes updates that were previously staged or installed.
     * @remarks
     * The **Commit** API was made public in the 1809 SDK. Any app compiled with the wuapi.h header can use the **Commit** method on previous versions of Windows 10 as well.
     * 
     * **Commit** should only be called once. This call should happen just prior to commencing a reboot. Calling it multiple times prior to a reboot is not supported and may cause the update to fail.
     * 
     * Calling **Commit** is required prior to rebooting when a feature update is pending reboot. If **Commit** is not called in this circumstance the update won’t be finalized and installed during the reboot.
     * 
     * **Commit** is safe to call prior to reboot for any other types of updates as well.
     * @param {Integer} dwFlags Reserved for future use.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows 
     * 
     * error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller4-commit
     */
    Commit(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateInstaller4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Commit)
    }
}
