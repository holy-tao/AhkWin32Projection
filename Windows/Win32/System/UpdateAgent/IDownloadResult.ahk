#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the result of a download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadResult
     * @type {Guid}
     */
    static IID => Guid("{daa4fdd0-4727-4dbe-a1e7-745dca317144}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HResult", "get_ResultCode", "GetUpdateResult"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-get_hresult
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-get_resultcode
     */
    get_ResultCode(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @param {Pointer<IUpdateDownloadResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-getupdateresult
     */
    GetUpdateResult(updateIndex, retval) {
        result := ComCall(9, this, "int", updateIndex, "ptr*", retval, "HRESULT")
        return result
    }
}
