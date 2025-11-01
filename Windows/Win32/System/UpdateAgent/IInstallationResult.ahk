#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_hresult
     */
    get_HResult(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_rebootrequired
     */
    get_RebootRequired(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_resultcode
     */
    get_ResultCode(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @param {Pointer<IUpdateInstallationResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-getupdateresult
     */
    GetUpdateResult(updateIndex, retval) {
        result := ComCall(10, this, "int", updateIndex, "ptr*", retval, "HRESULT")
        return result
    }
}
