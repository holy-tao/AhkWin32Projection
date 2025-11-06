#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstallationResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the progress of an asynchronous installation or uninstallation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationprogress
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationProgress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationProgress
     * @type {Guid}
     */
    static IID => Guid("{345c8244-43a3-4e32-a368-65f073b76f36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentUpdateIndex", "get_CurrentUpdatePercentComplete", "get_PercentComplete", "GetUpdateResult"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_currentupdateindex
     */
    get_CurrentUpdateIndex() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_currentupdatepercentcomplete
     */
    get_CurrentUpdatePercentComplete() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_percentcomplete
     */
    get_PercentComplete() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @returns {IUpdateInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(10, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstallationResult(retval)
    }
}
