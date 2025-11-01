#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the properties that indicate the status of a download operation for an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatedownloadresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloadResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloadResult
     * @type {Guid}
     */
    static IID => Guid("{bf99af76-b575-42ad-8aa4-33cbb5477af1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HResult", "get_ResultCode"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadresult-get_hresult
     */
    get_HResult(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadresult-get_resultcode
     */
    get_ResultCode(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
