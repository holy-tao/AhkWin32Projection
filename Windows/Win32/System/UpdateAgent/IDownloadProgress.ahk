#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the progress of an asynchronous download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadprogress
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadProgress extends IDispatch{
    /**
     * The interface identifier for IDownloadProgress
     * @type {Guid}
     */
    static IID => Guid("{d31a5bac-f719-4178-9dbb-5e2cb47fd18a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdateBytesDownloaded(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdateBytesToDownload(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdateIndex(retval) {
        result := ComCall(9, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_PercentComplete(retval) {
        result := ComCall(10, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     */
    get_TotalBytesDownloaded(retval) {
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     */
    get_TotalBytesToDownload(retval) {
        result := ComCall(12, this, "ptr", retval, "int")
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
        result := ComCall(13, this, "int", updateIndex, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdateDownloadPhase(retval) {
        result := ComCall(14, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdatePercentComplete(retval) {
        result := ComCall(15, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
