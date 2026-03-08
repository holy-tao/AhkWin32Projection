#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSession2.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionReferredEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionReferredEvent
     * @type {Guid}
     */
    static IID => Guid("{176a6828-4fcc-4f28-a862-04597a6cf1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_ReferredByURI", "get_ReferToURI", "get_ReferCookie", "Accept", "Reject", "SetReferredSessionState"]

    /**
     * @type {IRTCSession2} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {BSTR} 
     */
    ReferredByURI {
        get => this.get_ReferredByURI()
    }

    /**
     * @type {BSTR} 
     */
    ReferToURI {
        get => this.get_ReferToURI()
    }

    /**
     * @type {BSTR} 
     */
    ReferCookie {
        get => this.get_ReferCookie()
    }

    /**
     * 
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferredByURI() {
        pbstrReferredByURI := BSTR()
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "HRESULT")
        return pbstrReferredByURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferToURI() {
        pbstrReferoURI := BSTR()
        result := ComCall(9, this, "ptr", pbstrReferoURI, "HRESULT")
        return pbstrReferoURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferCookie() {
        pbstrReferCookie := BSTR()
        result := ComCall(10, this, "ptr", pbstrReferCookie, "HRESULT")
        return pbstrReferCookie
    }

    /**
     * The AcceptEx function (mswsock.h) accepts a new connection, returns the local and remote address, and receives the first block of data sent by the client application.
     * @remarks
     * The 
     * <b>AcceptEx</b> function combines several socket functions into a single API/kernel transition. The 
     * <b>AcceptEx</b> function, when successful, performs three tasks:
     * 
     * <ul>
     * <li>A new connection is accepted.</li>
     * <li>Both the local and remote addresses for the connection are returned.</li>
     * <li>The first block of data sent by the remote is received.</li>
     * </ul>
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The function pointer for the 
     * <b>AcceptEx</b> function must be obtained at run time by making a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function with the <b>SIO_GET_EXTENSION_FUNCTION_POINTER</b> opcode specified. The input buffer passed to the <b>WSAIoctl</b> function must contain <b>WSAID_ACCEPTEX</b>, a globally unique identifier (GUID) whose value identifies the <b>AcceptEx</b> extension function. On success, the output returned by the <b>WSAIoctl</b> function contains a pointer to the <b>AcceptEx</b> function. The <b>WSAID_ACCEPTEX</b> GUID is defined in the <i>Mswsock.h</i> header file.</div>
     * <div> </div>
     * 
     * 
     * A program can make a connection to a socket more quickly using 
     * <b>AcceptEx</b> instead of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-accept">accept</a> function.
     * 
     * A single output buffer receives the data, the local socket address (the server), and the remote socket address (the client).
     * 
     * Using a single buffer improves performance. When using 
     * <b>AcceptEx</b>, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nf-mswsock-getacceptexsockaddrs">GetAcceptExSockaddrs</a> function must be called to parse the buffer into its three distinct parts (data, local socket address, and remote socket address). On Windows XP and later, once the 
     * <b>AcceptEx</b> function completes and the <b>SO_UPDATE_ACCEPT_CONTEXT</b> option is set on the accepted socket, the local address associated with the accepted socket can also be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockname">getsockname</a> function. Likewise, the remote address associated with the accepted socket can be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getpeername">getpeername</a> function.
     * 
     * The buffer size for the local and remote address must be 16 bytes more than the size of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure for the transport protocol in use because the addresses are written in an internal format. For example, the size of a <b>sockaddr_in</b> (the address structure for TCP/IP) is 16 bytes. Therefore, a buffer size of at least 32 bytes must be specified for the local and remote addresses.
     * 
     * The 
     * <b>AcceptEx</b> function uses overlapped I/O, unlike the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-accept">accept</a> function. If your application uses 
     * <b>AcceptEx</b>, it can service a large number of clients with a relatively small number of threads. As with all overlapped Windows functions, either Windows events or completion ports can be used as a completion notification mechanism.
     * 
     * 
     * Another key difference between the 
     * <b>AcceptEx</b> function and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-accept">accept</a> function is that 
     * <b>AcceptEx</b> requires the caller to already have two sockets:
     * 
     * <ul>
     * <li>One that specifies the socket on which to listen.</li>
     * <li>One that specifies the socket on which to accept the connection.</li>
     * </ul>
     * 
     * 
     * The <i>sAcceptSocket</i> parameter must be an open socket that is neither bound nor connected.
     * 
     * The <i>lpNumberOfBytesTransferred</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function indicates the number of bytes received in the request.
     * 
     * 
     * When this operation is successfully completed, <i>sAcceptSocket</i> can be passed, but to the following functions only:
     * 
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-send">send</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasend">WSASend</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-recv">recv</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsarecv">WSARecv</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nf-mswsock-transmitfile">TransmitFile</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-closesocket">closesocket</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a>(only for SO_UPDATE_ACCEPT_CONTEXT)</dd>
     * </dl>
     * <div class="alert"><b>Note</b>  If the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nf-mswsock-transmitfile">TransmitFile</a> function is called with both the TF_DISCONNECT and TF_REUSE_SOCKET flags, the specified socket has been returned to a state in which it is neither bound nor connected. The socket handle can then be passed to the 
     * <b>AcceptEx</b> function in the <i>sAcceptSocket</i> parameter, but the socket cannot be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nc-mswsock-lpfn_connectex">ConnectEx</a> function.</div>
     * <div> </div>
     * 
     * 
     * When the 
     * <b>AcceptEx</b> function returns, the socket <i>sAcceptSocket</i> is in the default state for a connected socket. The socket <i>sAcceptSocket</i> does not inherit the properties of the socket associated with <i>sListenSocket</i> parameter until SO_UPDATE_ACCEPT_CONTEXT is set on the socket. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function to set the SO_UPDATE_ACCEPT_CONTEXT option, specifying <i>sAcceptSocket</i> as the socket handle and <i>sListenSocket</i> as the option value.
     * 
     * For example:
     * 
     * 
     * ```cpp
     * //Need to #include <mswsock.h> for SO_UPDATE_ACCEPT_CONTEXT
     * 
     * int iResult = 0;
     * 
     * iResult =  setsockopt( sAcceptSocket, SOL_SOCKET, SO_UPDATE_ACCEPT_CONTEXT, 
     *     (char *)&sListenSocket, sizeof(sListenSocket) );
     *    
     * 
     * ```
     * 
     * 
     * If a receive buffer is provided, the overlapped operation will not complete until a connection is accepted and data is read. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> function with the SO_CONNECT_TIME option to check whether a connection has been accepted. If it has been accepted, you can determine how long the connection has been established. The return value is the number of seconds that the socket has been connected. If the socket is not connected, the 
     * <b>getsockopt</b> returns 0xFFFFFFFF. Applications that check whether the overlapped operation has completed, in combination with the SO_CONNECT_TIME option, can determine that a connection has been accepted but no data has been received. Scrutinizing a connection in this manner enables an application to determine whether connections that have been established for a while have received no data. It is recommended such connections be terminated by closing the accepted socket, which forces the 
     * <b>AcceptEx</b> function call to complete with an error.
     * 
     * For example:
     * 
     * 
     * ```cpp
     * 
     * INT seconds;
     * INT bytes = sizeof(seconds);
     * int iResult = 0;
     * 
     * iResult = getsockopt( sAcceptSocket, SOL_SOCKET, SO_CONNECT_TIME,
     *                       (char *)&seconds, (PINT)&bytes );
     * 
     * if ( iResult != NO_ERROR ) {
     *     printf( "getsockopt(SO_CONNECT_TIME) failed: %u\n", WSAGetLastError( ) );
     *     exit(1);
     * }
     * 
     * ```
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>   All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the  operations complete. See <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> for more information.</div>
     * <div> </div>
     * 
     * 
     * <b>Windows Phone 8:</b> This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * <h3><a id="Example_Code"></a><a id="example_code"></a><a id="EXAMPLE_CODE"></a>Example Code</h3>
     * The following example uses the <b>AcceptEx</b> function using overlapped I/O and completion ports.
     * 
     * 
     * ```cpp
     * @returns {HRESULT} If no error occurs, the 
     * <b>AcceptEx</b> function completed successfully and a value of <b>TRUE</b> is returned.
     * 
     * If the function fails, 
     * <b>AcceptEx</b> returns <b>FALSE</b>. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> function can then be called to return extended error information. If 
     * <b>WSAGetLastError</b> returns <b>ERROR_IO_PENDING</b>, then the operation was successfully initiated and is still in progress. If the error is WSAECONNRESET, an incoming connection was indicated, but was subsequently terminated by the remote peer prior to accepting the call.
     * @see https://learn.microsoft.com/windows/win32/api/mswsock/nf-mswsock-acceptex
     */
    Accept() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enState 
     * @returns {HRESULT} 
     */
    SetReferredSessionState(enState) {
        result := ComCall(13, this, "int", enState, "HRESULT")
        return result
    }
}
