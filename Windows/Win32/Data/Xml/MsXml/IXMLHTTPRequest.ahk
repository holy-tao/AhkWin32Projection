#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLHTTPRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLHTTPRequest
     * @type {Guid}
     */
    static IID => Guid("{ed8c108d-4349-11d2-91a4-00c04f7969e8}")

    /**
     * The class identifier for XMLHTTPRequest
     * @type {Guid}
     */
    static CLSID => Guid("{ed8c108e-4349-11d2-91a4-00c04f7969e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["open", "setRequestHeader", "getResponseHeader", "getAllResponseHeaders", "send", "abort", "get_status", "get_statusText", "get_responseXML", "get_responseText", "get_responseBody", "get_responseStream", "get_readyState", "put_onreadystatechange"]

    /**
     * 
     * @param {BSTR} bstrMethod 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT} varAsync 
     * @param {VARIANT} bstrUser 
     * @param {VARIANT} bstrPassword 
     * @returns {HRESULT} 
     */
    open(bstrMethod, bstrUrl, varAsync, bstrUser, bstrPassword) {
        bstrMethod := bstrMethod is String ? BSTR.Alloc(bstrMethod).Value : bstrMethod
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(7, this, "ptr", bstrMethod, "ptr", bstrUrl, "ptr", varAsync, "ptr", bstrUser, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeader 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setRequestHeader(bstrHeader, bstrValue) {
        bstrHeader := bstrHeader is String ? BSTR.Alloc(bstrHeader).Value : bstrHeader
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(8, this, "ptr", bstrHeader, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeader 
     * @returns {BSTR} 
     */
    getResponseHeader(bstrHeader) {
        bstrHeader := bstrHeader is String ? BSTR.Alloc(bstrHeader).Value : bstrHeader

        pbstrValue := BSTR()
        result := ComCall(9, this, "ptr", bstrHeader, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getAllResponseHeaders() {
        pbstrHeaders := BSTR()
        result := ComCall(10, this, "ptr", pbstrHeaders, "HRESULT")
        return pbstrHeaders
    }

    /**
     * Sends data on a connected socket.
     * @param {VARIANT} varBody 
     * @returns {HRESULT} If no error occurs, 
     * <b>send</b> returns the total number of bytes sent, which can be less than the number requested to be sent in the <i>len</i> parameter. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code can be retrieved by calling 
     * <a href="/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful 
     * <a href="/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> call must occur before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested address is a broadcast address, but the appropriate flag was not set. Call 
     * <a href="/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> with the SO_BROADCAST socket option to enable use of the broadcast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINTR</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Sockets 1.1 call was canceled through 
     * <a href="/windows/desktop/api/winsock2/nf-winsock2-wsacancelblockingcall">WSACancelBlockingCall</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Sockets 1.1 call is in progress, or the service provider is still processing a callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>buf</i> parameter is not completely contained in a valid part of the user address space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETRESET</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has been broken due to the keep-alive activity detecting a failure while the operation was in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOBUFS</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No buffer space is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTCONN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTSOCK</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The descriptor is not a socket.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEOPNOTSUPP</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MSG_OOB was specified, but the socket is not stream-style such as type SOCK_STREAM, OOB data is not supported in the communication domain associated with this socket, or the socket is unidirectional and supports only receive operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAESHUTDOWN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket has been shut down; it is not possible to send on a socket after 
     * <a href="/windows/desktop/api/winsock/nf-winsock-shutdown">shutdown</a> has been invoked with <i>how</i> set to SD_SEND or SD_BOTH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEWOULDBLOCK</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket is marked as nonblocking and the requested operation would block.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEMSGSIZE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket is message oriented, and the message is larger than the maximum supported by the underlying transport.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEHOSTUNREACH</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote host cannot be reached from this host at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket has not been bound with 
     * <a href="/windows/desktop/api/winsock/nf-winsock-bind">bind</a>, or an unknown flag was specified, or MSG_OOB was specified for a socket with SO_OOBINLINE enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAECONNABORTED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The virtual circuit was terminated due to a time-out or other failure. The application should close the socket as it is no longer usable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAECONNRESET</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The virtual circuit was reset by the remote side executing a hard or abortive close. For UDP sockets, the remote host was unable to deliver a previously sent UDP datagram and responded with a "Port Unreachable" ICMP packet. The application should close the socket as it is no longer usable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAETIMEDOUT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has been dropped, because of a network failure or because the system on the other end went down without notice.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsock2/nf-winsock2-send
     */
    send(varBody) {
        result := ComCall(11, this, "ptr", varBody, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    abort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_status() {
        result := ComCall(13, this, "int*", &plStatus := 0, "HRESULT")
        return plStatus
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_statusText() {
        pbstrStatus := BSTR()
        result := ComCall(14, this, "ptr", pbstrStatus, "HRESULT")
        return pbstrStatus
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_responseXML() {
        result := ComCall(15, this, "ptr*", &ppBody := 0, "HRESULT")
        return IDispatch(ppBody)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_responseText() {
        pbstrBody := BSTR()
        result := ComCall(16, this, "ptr", pbstrBody, "HRESULT")
        return pbstrBody
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_responseBody() {
        pvarBody := VARIANT()
        result := ComCall(17, this, "ptr", pvarBody, "HRESULT")
        return pvarBody
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_responseStream() {
        pvarBody := VARIANT()
        result := ComCall(18, this, "ptr", pvarBody, "HRESULT")
        return pvarBody
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(19, this, "int*", &plState := 0, "HRESULT")
        return plState
    }

    /**
     * 
     * @param {IDispatch} pReadyStateSink 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(pReadyStateSink) {
        result := ComCall(20, this, "ptr", pReadyStateSink, "HRESULT")
        return result
    }
}
