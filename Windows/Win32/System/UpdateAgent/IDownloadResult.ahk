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
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_HResult(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_ResultCode(retval) {
        result := ComCall(8, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @param {Pointer<IUpdateDownloadResult>} retval 
     * @returns {HRESULT} 
     */
    GetUpdateResult(updateIndex, retval) {
        result := ComCall(9, this, "int", updateIndex, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
