#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInstallationJob.ahk" { IInstallationJob }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInstallationProgressChangedCallbackArgs.ahk" { IInstallationProgressChangedCallbackArgs }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the Invoke method that handles the notification about the on-going progress of an asynchronous installation or uninstallation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationProgressChangedCallback extends IUnknown {
    /**
     * The interface identifier for IInstallationProgressChangedCallback
     * @type {Guid}
     */
    static IID := Guid("{e01402d5-f8da-43ba-a012-38894bd048f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationProgressChangedCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationProgressChangedCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the notification of the change in the progress of an asynchronous installation or uninstallation that was initiated by a call to the IUpdateInstaller.BeginInstall method or the IUpdateInstaller.BeginUninstall method.
     * @param {IInstallationJob} installationJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationjob">IInstallationJob</a> interface that contains the installation information.
     * @param {IInstallationProgressChangedCallbackArgs} callbackArgs An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallbackargs">IInstallationProgressChangedCallbackArgs</a> interface that contains the installation progress data.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns  a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogresschangedcallback-invoke
     */
    Invoke(installationJob, callbackArgs) {
        result := ComCall(3, this, "ptr", installationJob, "ptr", callbackArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInstallationProgressChangedCallback.IID.Equals(iid)) {
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
