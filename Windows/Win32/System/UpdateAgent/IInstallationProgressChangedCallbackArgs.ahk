#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInstallationProgress.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the change in the progress of an asynchronous installation or uninstallation at the time the callback was made.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationprogresschangedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationProgressChangedCallbackArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationProgressChangedCallbackArgs
     * @type {Guid}
     */
    static IID => Guid("{e4f14e1e-689d-4218-a0b9-bc189c484a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Progress"]

    /**
     * @type {IInstallationProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * 
     * @returns {IInstallationProgress} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogresschangedcallbackargs-get_progress
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationProgress(retval)
    }
}
