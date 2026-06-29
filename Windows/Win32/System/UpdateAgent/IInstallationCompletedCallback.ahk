#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInstallationJob.ahk" { IInstallationJob }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IInstallationCompletedCallbackArgs.ahk" { IInstallationCompletedCallbackArgs }

/**
 * Handles the notification that indicates that an asynchronous installation or uninstallation is complete.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationCompletedCallback extends IUnknown {
    /**
     * The interface identifier for IInstallationCompletedCallback
     * @type {Guid}
     */
    static IID := Guid("{45f4f6f3-d602-4f98-9a8a-3efa152ad2d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationCompletedCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationCompletedCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the notification of the completion of an asynchronous installation or uninstallation that is initiated by a call to IUpdateInstaller.BeginInstall or IUpdateInstaller.BeginUninstall.
     * @param {IInstallationJob} installationJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that contains the installation information.
     * @param {IInstallationCompletedCallbackArgs} callbackArgs This parameter is reserved for future use and can be ignored.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationcompletedcallback-invoke
     */
    Invoke(installationJob, callbackArgs) {
        result := ComCall(3, this, "ptr", installationJob, "ptr", callbackArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInstallationCompletedCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
