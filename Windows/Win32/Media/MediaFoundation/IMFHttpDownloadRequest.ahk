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
     * Invoked by Microsoft Media Foundation to add a single HTTP header to a HTTP request. Microsoft Media Foundation will invoke this method once for each header that shall be included in the HTTP request, before it invokes the BeginSendRequest method.
     * @param {PWSTR} szHeader Contains a single HTTP request header, for example, “Accept: /”. The string does not include the carriage return or line feed characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the header to the list of headers to be sent with the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-addheader
     */
    AddHeader(szHeader) {
        szHeader := szHeader is String ? StrPtr(szHeader) : szHeader

        result := ComCall(3, this, "ptr", szHeader, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to send a HTTP or HTTPS request.
     * @param {Pointer<Integer>} pbPayload Pointer to a buffer that contains the message payload to send in the request. This parameter is used for POST requests. GET requests do not carry a message payload and therefore <i>pbPayload</i> is NULL.
     * @param {Integer} cbPayload The size of the <i>pbPayload</i> buffer, in bytes.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object that is implemented by Microsoft Media Foundation.
     * @param {IUnknown} punkState Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by Microsoft Media Foundation. This parameter can be NULL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully started the asynchronous operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-beginsendrequest
     */
    BeginSendRequest(pbPayload, cbPayload, pCallback, punkState) {
        pbPayloadMarshal := pbPayload is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbPayloadMarshal, pbPayload, "uint", cbPayload, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to complete the asynchronous operation started by BeginSendRequest.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Microsoft Media Foundation will pass in the same pointer that its callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was successfully sent to the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-endsendrequest
     */
    EndSendRequest(pResult) {
        result := ComCall(5, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to receive the response, provided by the server, in response to a previously sent HTTP or HTTPS request. Media Foundation invokes this method only after having successfully invoked the EndSendRequest method.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object that is implemented by Microsoft Media Foundation.
     * @param {IUnknown} punkState Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by Microsoft Media Foundation. This parameter can be NULL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully started the asynchronous operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-beginreceiveresponse
     */
    BeginReceiveResponse(pCallback, punkState) {
        result := ComCall(6, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to complete the asynchronous operation started by BeginReceiveResponse.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Microsoft Media Foundation will pass in the same pointer that its callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully received the HTTP response and associated headers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-endreceiveresponse
     */
    EndReceiveResponse(pResult) {
        result := ComCall(7, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to receive the message body of the response to a previously sent HTTP or HTTPS request.
     * @param {Integer} cb Specifies the size of the <i>pb</i> buffer, in bytes.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object that is implemented by Microsoft Media Foundation.
     * @param {IUnknown} punkState Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by Microsoft Media Foundation. This parameter can be NULL.
     * @returns {Integer} Pointer to a buffer that receives the data.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload
     */
    BeginReadPayload(cb, pCallback, punkState) {
        result := ComCall(8, this, "char*", &pb := 0, "uint", cb, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return pb
    }

    /**
     * Invoked by Microsoft Media Foundation to complete the asynchronous operation started by BeginReadPayload.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Microsoft Media Foundation will pass in the same pointer that its callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {Pointer<Integer>} pqwOffset The offset of the first byte written to the buffer, relative to the complete message body of the current HTTP request. For example, when Media Foundation invokes <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload">BeginReadPayload</a> for the first time on a given <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfhttpdownloadrequest">IMFHttpDownloadRequest</a>, and specifies a buffer size of 100, the <i>pqwOffset</i> parameter will be set to 0. Then, when Media Foundation invokes <b>BeginReadPayload</b> for the second time on the same <b>IMNFHttpDownloadRequest</b>, the <i>pqwOffset</i> parameter will be set to 100.
     * @param {Pointer<Integer>} pcbRead Specifies the number of bytes written to the buffer that Media Foundation provided when invoking <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload">BeginReadPayload</a>. Note that this value must always be equal to the size of the buffer specified in <b>BeginReadPayload</b>, unless the request failed, or unless the end of the message body has been reached.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully wrote data to the buffer provided in <a href="/windows/desktop/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload">BeginReadPayload</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-endreadpayload
     */
    EndReadPayload(pResult, pqwOffset, pcbRead) {
        pqwOffsetMarshal := pqwOffset is VarRef ? "uint*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pResult, pqwOffsetMarshal, pqwOffset, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to retrieve the values of specified HTTP headers from the response to a previously sent HTTP or HTTPS request.
     * @param {PWSTR} szHeaderName The name of the HTTP header for which the value is being queried.
     * @param {Integer} dwIndex The index number of the specified header, for the case where the response contains multiple headers with the same name. A value of 0 indicates that the value of the first header with the specified name is requested, 1 indicates that the second header is requested, and so on.
     * @returns {PWSTR} Set to the value of the requested header, not including the carriage return or line feed characters. The memory for <i>ppszHeaderValue</i> must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and will be freed by Media Foundation with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-queryheader
     */
    QueryHeader(szHeaderName, dwIndex) {
        szHeaderName := szHeaderName is String ? StrPtr(szHeaderName) : szHeaderName

        result := ComCall(10, this, "ptr", szHeaderName, "uint", dwIndex, "ptr*", &ppszHeaderValue := 0, "HRESULT")
        return ppszHeaderValue
    }

    /**
     * Returns the URL that is used for sending the request.
     * @returns {PWSTR} The URL that is used for sending the request to the server. Note that this URL may be different if the server has issued a HTTP protocol “redirect”. The memory for <i>pszURL</i> must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and will be freed by Media Foundation with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-geturl
     */
    GetURL() {
        result := ComCall(11, this, "ptr*", &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * Invoked by Microsoft Media Foundation to detect the case when a HTTP or HTTPS request has been redirected to a different server of different &quot;origin&quot;.
     * @returns {BOOL} Set to TRUE if the current request has a “null” source origin. The source origin would become “null” if the HTTP request was redirected from one server to another, and the two servers have different origins.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-hasnullsourceorigin
     */
    HasNullSourceOrigin() {
        result := ComCall(12, this, "int*", &pfNullSourceOrigin := 0, "HRESULT")
        return pfNullSourceOrigin
    }

    /**
     * Invoked by Microsoft Media Foundation to retrieve the values of the TimeSeekRange.DLNA.ORG HTTP header, if any, that the server specified in its response.
     * @param {Pointer<Integer>} pqwStartTime The starting time offset, specified in units of one-hundred nanoseconds.
     * @param {Pointer<Integer>} pqwStopTime The end time offset, specified in units of one-hundred nanoseconds
     * @param {Pointer<Integer>} pqwDuration The time duration of data contained in the response, specified in units of one-hundred nanoseconds. Set this parameter to 0 if the server did not specify a duration (i.e., specified “*” as the duration.)
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TimeSeekRange.DLNA.ORG HTTP header was present in the response, and could be successfully parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TimeSeekRange.DLNA.ORG HTTP header was not present in the response, or had a syntax error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pfNullSOurceOrigin</i> parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-gettimeseekresult
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        pqwStartTimeMarshal := pqwStartTime is VarRef ? "uint*" : "ptr"
        pqwStopTimeMarshal := pqwStopTime is VarRef ? "uint*" : "ptr"
        pqwDurationMarshal := pqwDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pqwStartTimeMarshal, pqwStartTime, pqwStopTimeMarshal, pqwStopTime, pqwDurationMarshal, pqwDuration, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to retrieve the HTTP status code that the server specified in its response. Media Foundation invokes this method after a successful call to EndReceiveResponse.
     * @returns {Integer} The HTTP status code of the response. For example, the value is  200 for a typical successful response.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-gethttpstatus
     */
    GetHttpStatus() {
        result := ComCall(14, this, "uint*", &pdwHttpStatus := 0, "HRESULT")
        return pdwHttpStatus
    }

    /**
     * Invoked by Microsoft Media Foundation to check if it should invoke BeginReadPayload to read data from the message body of the response.
     * @returns {BOOL} Set to FALSE if a call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfhttpdownloadrequest-beginreadpayload">BeginReadPayload</a> can return one or more bytes of data to Media Foundation. Set to TRUE when there is no more data to return.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-getatendofpayload
     */
    GetAtEndOfPayload() {
        result := ComCall(15, this, "int*", &pfAtEndOfPayload := 0, "HRESULT")
        return pfAtEndOfPayload
    }

    /**
     * Invoked by Microsoft Media Foundation to retrieve the total length of the resource that is being downloaded, if known.
     * @returns {Integer} The total length, in bytes, of the resource being downloaded, if known. If not known, set to <b>MAX_ULONG</b> (0xFFFFFFFFFFFFFFFF).
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-gettotallength
     */
    GetTotalLength() {
        result := ComCall(16, this, "uint*", &pqwTotalLength := 0, "HRESULT")
        return pqwTotalLength
    }

    /**
     * Invoked by Microsoft Media Foundation to retrieve the offset of the last byte in the current response, counted from the start of the resource. This is useful when a request uses the HTTP “Range” header to download only a portion of a resource.
     * @returns {Integer} The offset of the last byte in the current response, counted from the start of the resource, if known. For example, if the request specified the HTTP header, “Range: bytes=1000-“ and the size of the message body in the response is 200 bytes, then <i>pwqRangeEnd</i> becomes 1199. If the value is not known, for example, because the server did not specify the size of its response, <i>pwqRangeEnd</i> is set to MAX_ULONG (0xFFFFFFFFFFFFFFFF).
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-getrangeendoffset
     */
    GetRangeEndOffset() {
        result := ComCall(17, this, "uint*", &pqwRangeEnd := 0, "HRESULT")
        return pqwRangeEnd
    }

    /**
     * Invoked by Microsoft Media Foundation to allow IMFHttpDownloadRequest to free any internal resources. It will also cancel the current request if it is still in progress.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully closed the request object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadrequest-close
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
