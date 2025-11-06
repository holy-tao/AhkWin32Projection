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
        pbPayloadMarshal := pbPayload is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbPayloadMarshal, pbPayload, "uint", cbPayload, "ptr", pCallback, "ptr", punkState, "HRESULT")
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
     * @param {Integer} cb 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload
     */
    BeginReadPayload(cb, pCallback, punkState) {
        result := ComCall(8, this, "char*", &pb := 0, "uint", cb, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return pb
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
        pqwOffsetMarshal := pqwOffset is VarRef ? "uint*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pResult, pqwOffsetMarshal, pqwOffset, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szHeaderName 
     * @param {Integer} dwIndex 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-queryheader
     */
    QueryHeader(szHeaderName, dwIndex) {
        szHeaderName := szHeaderName is String ? StrPtr(szHeaderName) : szHeaderName

        result := ComCall(10, this, "ptr", szHeaderName, "uint", dwIndex, "ptr*", &ppszHeaderValue := 0, "HRESULT")
        return ppszHeaderValue
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-geturl
     */
    GetURL() {
        result := ComCall(11, this, "ptr*", &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-hasnullsourceorigin
     */
    HasNullSourceOrigin() {
        result := ComCall(12, this, "int*", &pfNullSourceOrigin := 0, "HRESULT")
        return pfNullSourceOrigin
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
        pqwStartTimeMarshal := pqwStartTime is VarRef ? "uint*" : "ptr"
        pqwStopTimeMarshal := pqwStopTime is VarRef ? "uint*" : "ptr"
        pqwDurationMarshal := pqwDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pqwStartTimeMarshal, pqwStartTime, pqwStopTimeMarshal, pqwStopTime, pqwDurationMarshal, pqwDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gethttpstatus
     */
    GetHttpStatus() {
        result := ComCall(14, this, "uint*", &pdwHttpStatus := 0, "HRESULT")
        return pdwHttpStatus
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getatendofpayload
     */
    GetAtEndOfPayload() {
        result := ComCall(15, this, "int*", &pfAtEndOfPayload := 0, "HRESULT")
        return pfAtEndOfPayload
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-gettotallength
     */
    GetTotalLength() {
        result := ComCall(16, this, "uint*", &pqwTotalLength := 0, "HRESULT")
        return pqwTotalLength
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfhttpdownloadrequest-getrangeendoffset
     */
    GetRangeEndOffset() {
        result := ComCall(17, this, "uint*", &pqwRangeEnd := 0, "HRESULT")
        return pqwRangeEnd
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
