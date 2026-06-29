#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInstallationProgress.ahk" { IInstallationProgress }

/**
 * Contains information about the change in the progress of an asynchronous installation or uninstallation at the time the callback was made.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationprogresschangedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationProgressChangedCallbackArgs extends IDispatch {
    /**
     * The interface identifier for IInstallationProgressChangedCallbackArgs
     * @type {Guid}
     */
    static IID := Guid("{e4f14e1e-689d-4218-a0b9-bc189c484a01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationProgressChangedCallbackArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Progress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationProgressChangedCallbackArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IInstallationProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Gets an interface that contains the progress of the asynchronous installation or uninstallation at the time the callback was made.
     * @returns {IInstallationProgress} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogresschangedcallbackargs-get_progress
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationProgress(retval)
    }

    Query(iid) {
        if (IInstallationProgressChangedCallbackArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Progress := CallbackCreate(GetMethod(implObj, "get_Progress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Progress)
    }
}
