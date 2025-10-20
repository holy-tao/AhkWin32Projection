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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddHeader", "BeginSendRequest", "EndSendRequest", "BeginReceiveResponse", "EndReceiveResponse", "BeginReadPayload", "EndReadPayload", "QueryHeader", "GetURL", "HasNullSourceOrigin", "GetTimeSeekResult", "GetHttpStatus", "GetAtEndOfPayload", "GetTotalLength", "GetRangeEndOffset", "Close"]

    /**
     * 
     * @param {PWSTR} szHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-addheader
     */
    AddHeader(szHeader) {
        szHeader := szHeader is String ? StrPtr(szHeader) : szHeader

        result := ComCall(3, this, "ptr", szHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbPayload 
     * @param {Integer} cbPayload 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginsendrequest
     */
    BeginSendRequest(pbPayload, cbPayload, pCallback, punkState) {
        result := ComCall(4, this, "char*", pbPayload, "uint", cbPayload, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endsendrequest
     */
    EndSendRequest(pResult) {
        result := ComCall(5, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreceiveresponse
     */
    BeginReceiveResponse(pCallback, punkState) {
        result := ComCall(6, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endreceiveresponse
     */
    EndReceiveResponse(pResult) {
        result := ComCall(7, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pb 
     * @param {Integer} cb 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload
     */
    BeginReadPayload(pb, cb, pCallback, punkState) {
        result := ComCall(8, this, "char*", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<Integer>} pqwOffset 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-endreadpayload
     */
    EndReadPayload(pResult, pqwOffset, pcbRead) {
        result := ComCall(9, this, "ptr", pResult, "uint*", pqwOffset, "uint*", pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szHeaderName 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} ppszHeaderValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-queryheader
     */
    QueryHeader(szHeaderName, dwIndex, ppszHeaderValue) {
        szHeaderName := szHeaderName is String ? StrPtr(szHeaderName) : szHeaderName

        result := ComCall(10, this, "ptr", szHeaderName, "uint", dwIndex, "ptr", ppszHeaderValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-geturl
     */
    GetURL(ppszURL) {
        result := ComCall(11, this, "ptr", ppszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfNullSourceOrigin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-hasnullsourceorigin
     */
    HasNullSourceOrigin(pfNullSourceOrigin) {
        result := ComCall(12, this, "ptr", pfNullSourceOrigin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwStartTime 
     * @param {Pointer<Integer>} pqwStopTime 
     * @param {Pointer<Integer>} pqwDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gettimeseekresult
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        result := ComCall(13, this, "uint*", pqwStartTime, "uint*", pqwStopTime, "uint*", pqwDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHttpStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gethttpstatus
     */
    GetHttpStatus(pdwHttpStatus) {
        result := ComCall(14, this, "uint*", pdwHttpStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAtEndOfPayload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getatendofpayload
     */
    GetAtEndOfPayload(pfAtEndOfPayload) {
        result := ComCall(15, this, "ptr", pfAtEndOfPayload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwTotalLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gettotallength
     */
    GetTotalLength(pqwTotalLength) {
        result := ComCall(16, this, "uint*", pqwTotalLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwRangeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getrangeendoffset
     */
    GetRangeEndOffset(pqwRangeEnd) {
        result := ComCall(17, this, "uint*", pqwRangeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-close
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
