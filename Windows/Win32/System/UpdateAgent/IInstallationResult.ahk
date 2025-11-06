#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstallationResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the result of an installation or uninstallation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationResult
     * @type {Guid}
     */
    static IID => Guid("{a43c56d6-7451-48d4-af96-b6cd2d0d9b7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HResult", "get_RebootRequired", "get_ResultCode", "GetUpdateResult"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @returns {IUpdateInstallationResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(10, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstallationResult(retval)
    }
}
