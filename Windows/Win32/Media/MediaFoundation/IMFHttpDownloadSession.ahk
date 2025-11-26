#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFHttpDownloadRequest.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications implement this interface to override the default implementation of the HTTP and HTTPS protocols used by Microsoft Media Foundation.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfhttpdownloadsession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHttpDownloadSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFHttpDownloadSession
     * @type {Guid}
     */
    static IID => Guid("{71fa9a2c-53ce-4662-a132-1a7e8cbf62db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetServer", "CreateRequest", "Close"]

    /**
     * Called by Microsoft Media Foundation to specify parameters common to all requests created by this instance of IMFHttpDownloadSession.
     * @param {PWSTR} szServerName The host name, fully qualified DNS name, or IP address of the HTTP server that the requests shall be sent to.
     * @param {Integer} nPort The TCP port number of the server.
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
     * Successfully stored the supplied data.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadsession-setserver
     */
    SetServer(szServerName, nPort) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(3, this, "ptr", szServerName, "uint", nPort, "HRESULT")
        return result
    }

    /**
     * Invoked by Microsoft Media Foundation to create an object that implements the IMFHttpDownloadRequest interface, which is used to send a single HTTP, or HTTPS request.
     * @param {PWSTR} szObjectName Pointer to a string that contains the name of the target resource of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier. The target resource always begins with a forward slash character and includes any query string that was included on the URL.
     * @param {BOOL} fBypassProxyCache If set to TRUE, indicates that the request should be forwarded to the originating server rather than sending a cached version of a resource from a proxy server. When this flag is set to TRUE, a "Pragma: no-cache" header should be added to the request. When creating an HTTP/1.1 request, a "Cache-Control: no-cache" should also be added.
     * @param {BOOL} fSecure If set to TRUE, causes the secure variant of the protocol to be used, if applicable. For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfhttpdownloadsession">IMFHttpDownloadSession</a> is for HTTP/HTTPS, setting <i>fSecure</i> to TRUE will cause the request to use HTTPS. Otherwise, the unsecure variant of the protocol (in this example, HTTP) is used.
     * @param {PWSTR} szVerb Pointer to a string that contains the HTTP verb to use in the request. If this parameter is NULL, the function uses GET as the HTTP verb. 
     * 
     * <div class="alert"><b>Note</b>  This string should be all uppercase. Many servers treat HTTP verbs as case-sensitive, and the Internet Engineering Task Force (IETF) Requests for Comments (RFCs) spell these verbs using uppercase characters only.</div>
     * <div> </div>
     * @param {PWSTR} szReferrer Pointer to a string that specifies the URL of the document from which the URL in the request <i>szObjectName</i> was obtained. If this parameter is set to NULL, no referring document is specified.
     * @returns {IMFHttpDownloadRequest} Upon successful return of the method, this parameter is set to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfhttpdownloadrequest">IMFHttpDownloadRequest</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadsession-createrequest
     */
    CreateRequest(szObjectName, fBypassProxyCache, fSecure, szVerb, szReferrer) {
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szVerb := szVerb is String ? StrPtr(szVerb) : szVerb
        szReferrer := szReferrer is String ? StrPtr(szReferrer) : szReferrer

        result := ComCall(4, this, "ptr", szObjectName, "int", fBypassProxyCache, "int", fSecure, "ptr", szVerb, "ptr", szReferrer, "ptr*", &ppRequest := 0, "HRESULT")
        return IMFHttpDownloadRequest(ppRequest)
    }

    /**
     * Invoked by Microsoft Media Foundation to specify that no more HTTP requests will be created, and allows IMFHttpDownloadSession to free any internal resources.
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
     * Successfully closed the session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfhttpdownloadsession-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
