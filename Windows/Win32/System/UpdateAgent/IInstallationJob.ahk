#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IUpdateCollection.ahk
#Include .\IInstallationProgress.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains properties and methods that are available to an installation or uninstallation operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationjob
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationJob
     * @type {Guid}
     */
    static IID => Guid("{5c209f0b-bad5-432a-9556-4699bed2638a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AsyncState", "get_IsCompleted", "get_Updates", "CleanUp", "GetProgress", "RequestAbort"]

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
     * 
     * This state object can be used by the caller to identify a particular download or to pass information from the caller to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogresschangedcallback">IInstallationProgressChangedCallback</a>  interface or the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationcompletedcallback">IInstallationCompletedCallback</a> interface.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a value that indicates whether a call to the IUpdateInstaller.BeginInstall or IUpdateInstaller.BeginUninstall method is completely processed.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a read-only collection of the updates that are specified in the installation or uninstallation.
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Waits for an asynchronous operation to be completed and then releases all the callbacks.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-cleanup
     */
    CleanUp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Returns an IInstallationProgress interface that describes the current progress of an installation or uninstallation.
     * @returns {IInstallationProgress} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iinstallationprogress">IInstallationProgress</a> interface that describes the current progress of an installation or uninstallation.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-getprogress
     */
    GetProgress() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationProgress(retval)
    }

    /**
     * Makes a request to cancel the installation or uninstallation.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns  a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iinstallationjob-requestabort
     */
    RequestAbort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
