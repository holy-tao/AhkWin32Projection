#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IInstallationProgress.ahk" { IInstallationProgress }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains properties and methods that are available to an installation or uninstallation operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationjob
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationJob extends IDispatch {
    /**
     * The interface identifier for IInstallationJob
     * @type {Guid}
     */
    static IID := Guid("{5c209f0b-bad5-432a-9556-4699bed2638a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationJob interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AsyncState  : IntPtr
        get_IsCompleted : IntPtr
        get_Updates     : IntPtr
        CleanUp         : IntPtr
        GetProgress     : IntPtr
        RequestAbort    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    AsyncState {
        get => this.get_AsyncState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsCompleted {
        get => this.get_IsCompleted()
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
    }

    /**
     * Gets the caller-specific state object that is passed to the IUpdateInstaller.BeginInstall method or to the IUpdateInstaller.BeginUninstall method.
     * @remarks
     * This state object can be used by the caller to identify a particular download or to pass information from the caller to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a>  interface or the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a value that indicates whether a call to the IUpdateInstaller.BeginInstall or IUpdateInstaller.BeginUninstall method is completely processed.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a read-only collection of the updates that are specified in the installation or uninstallation.
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Waits for an asynchronous operation to be completed and then releases all the callbacks.
     * @remarks
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-cleanup
     */
    CleanUp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Returns an IInstallationProgress interface that describes the current progress of an installation or uninstallation.
     * @remarks
     * You must make repeated calls to the <b>GetProgress</b> method to track the progress of a download. You must do this because  
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstallationresult">IUpdateInstallationResult</a> interface is not automatically updated during a download.
     * @returns {IInstallationProgress} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogress">IInstallationProgress</a> interface that describes the current progress of an installation or uninstallation.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-getprogress
     */
    GetProgress() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationProgress(retval)
    }

    /**
     * Makes a request to cancel the installation or uninstallation.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns  a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-requestabort
     */
    RequestAbort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInstallationJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AsyncState := CallbackCreate(GetMethod(implObj, "get_AsyncState"), flags, 2)
        this.vtbl.get_IsCompleted := CallbackCreate(GetMethod(implObj, "get_IsCompleted"), flags, 2)
        this.vtbl.get_Updates := CallbackCreate(GetMethod(implObj, "get_Updates"), flags, 2)
        this.vtbl.CleanUp := CallbackCreate(GetMethod(implObj, "CleanUp"), flags, 1)
        this.vtbl.GetProgress := CallbackCreate(GetMethod(implObj, "GetProgress"), flags, 2)
        this.vtbl.RequestAbort := CallbackCreate(GetMethod(implObj, "RequestAbort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AsyncState)
        CallbackFree(this.vtbl.get_IsCompleted)
        CallbackFree(this.vtbl.get_Updates)
        CallbackFree(this.vtbl.CleanUp)
        CallbackFree(this.vtbl.GetProgress)
        CallbackFree(this.vtbl.RequestAbort)
    }
}
