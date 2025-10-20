#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications implement this interface to override the default implementation of the HTTP and HTTPS protocols used by Microsoft Media Foundation.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfhttpdownloadrequest
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHttpDownloadRequest extends IUnknown{
    /**
     * The interface identifier for IMFHttpDownloadRequest
     * @type {Guid}
     */
    static IID => Guid("{f779fddf-26e7-4270-8a8b-b983d1859de0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} szHeader 
     * @returns {HRESULT} 
     */
    AddHeader(szHeader) {
        szHeader := szHeader is String ? StrPtr(szHeader) : szHeader

        result := ComCall(3, this, "ptr", szHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbPayload 
     * @param {Integer} cbPayload 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginSendRequest(pbPayload, cbPayload, pCallback, punkState) {
        result := ComCall(4, this, "char*", pbPayload, "uint", cbPayload, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndSendRequest(pResult) {
        result := ComCall(5, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginReceiveResponse(pCallback, punkState) {
        result := ComCall(6, this, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndReceiveResponse(pResult) {
        result := ComCall(7, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pb 
     * @param {Integer} cb 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginReadPayload(pb, cb, pCallback, punkState) {
        result := ComCall(8, this, "char*", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<UInt64>} pqwOffset 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    EndReadPayload(pResult, pqwOffset, pcbRead) {
        result := ComCall(9, this, "ptr", pResult, "uint*", pqwOffset, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szHeaderName 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} ppszHeaderValue 
     * @returns {HRESULT} 
     */
    QueryHeader(szHeaderName, dwIndex, ppszHeaderValue) {
        szHeaderName := szHeaderName is String ? StrPtr(szHeaderName) : szHeaderName

        result := ComCall(10, this, "ptr", szHeaderName, "uint", dwIndex, "ptr", ppszHeaderValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszURL 
     * @returns {HRESULT} 
     */
    GetURL(ppszURL) {
        result := ComCall(11, this, "ptr", ppszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfNullSourceOrigin 
     * @returns {HRESULT} 
     */
    HasNullSourceOrigin(pfNullSourceOrigin) {
        result := ComCall(12, this, "ptr", pfNullSourceOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwStartTime 
     * @param {Pointer<UInt64>} pqwStopTime 
     * @param {Pointer<UInt64>} pqwDuration 
     * @returns {HRESULT} 
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        result := ComCall(13, this, "uint*", pqwStartTime, "uint*", pqwStopTime, "uint*", pqwDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHttpStatus 
     * @returns {HRESULT} 
     */
    GetHttpStatus(pdwHttpStatus) {
        result := ComCall(14, this, "uint*", pdwHttpStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAtEndOfPayload 
     * @returns {HRESULT} 
     */
    GetAtEndOfPayload(pfAtEndOfPayload) {
        result := ComCall(15, this, "ptr", pfAtEndOfPayload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwTotalLength 
     * @returns {HRESULT} 
     */
    GetTotalLength(pqwTotalLength) {
        result := ComCall(16, this, "uint*", pqwTotalLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwRangeEnd 
     * @returns {HRESULT} 
     */
    GetRangeEndOffset(pqwRangeEnd) {
        result := ComCall(17, this, "uint*", pqwRangeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
