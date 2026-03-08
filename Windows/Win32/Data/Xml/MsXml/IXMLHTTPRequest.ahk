#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk

/**
 * Provides the methods and properties needed to configure and send HTTP requests and use callbacks to receive notifications during HTTP response processing. Note  This interface is supported on Windows Phone 8.1.  .
 * @remarks
 * The <b>IXMLHTTPRequest2</b> interface is extended by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface. The <b>IXMLHTTPRequest3</b> inherits all the methods and properties of the <b>IXMLHTTPRequest2</b> interface.
 * 
 * The <b>IXMLHTTPRequest2</b> interface configures and sends HTTP request operations and uses  callbacks  to receive notifications  during response processing. The <b>IXMLHTTPRequest2</b> allows applications to run in a Multi Threaded Apartment (MTA), a requirement for running under the Windows Runtime (WinRT).
 * 
 * The <b>IXMLHTTPRequest2</b> interface supports the following features:
 * 
 * 
 * <ul>
 * <li>Set properties on outgoing HTTP requests.</li>
 * <li>Set cookies in the HTTP cookie jar for use in outgoing HTTP requests.</li>
 * <li>Get cookies from the HTTP cookie jar.</li>
 * <li>Process incoming HTTP response data before the HTTP response has finished downloading.</li>
 * <li>Create custom streams to receive HTTP responses.</li>
 * </ul>
 * 
 * 
 * <b>IXMLHTTPRequest2</b> implements a callback model for event handling. Because <b>IXMLHTTPRequest2</b> methods allow only asynchronous method calls, to receive completion callbacks an application must pass a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2callback">IXMLHTTPRequest2Callback</a> object when it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-open">IXMLHTTPRequest2::Open</a> method to create an HTTP request.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/nn-msxml6-ixmlhttprequest2
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
     * @type {Integer} 
     */
    status {
        get => this.get_status()
    }

    /**
     * @type {BSTR} 
     */
    statusText {
        get => this.get_statusText()
    }

    /**
     * @type {IDispatch} 
     */
    responseXML {
        get => this.get_responseXML()
    }

    /**
     * @type {BSTR} 
     */
    responseText {
        get => this.get_responseText()
    }

    /**
     * @type {VARIANT} 
     */
    responseBody {
        get => this.get_responseBody()
    }

    /**
     * @type {VARIANT} 
     */
    responseStream {
        get => this.get_responseStream()
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {HRESULT} 
     */
    onreadystatechange {
        set => this.put_onreadystatechange(value)
    }

    /**
     * The open command initializes a device. All MCI devices recognize this command.
     * @remarks
     * MCI reserves "cdaudio" for the CD audio device type, "videodisc" for the videodisc device type, "sequencer" for the MIDI sequencer device type, "AVIVideo" for the digital-video device type, and "waveaudio" for the waveform-audio device type.
     * 
     * As an alternative to the "type" flag, MCI can select the device based on the extension used by the file, as recorded in the registry or the \[mci extension\] section of the SYSTEM.INI file.
     * 
     * MCI can open AVI files by using a file-interface pointer or a stream-interface pointer. To open a file by using either type of interface pointer, specify an at sign (@) followed by the interface pointer in place of the file or device name for the *lpszDevice* parameter. For more information about the file and stream interfaces, see " [AVIFile Functions and Macros](avifile-functions-and-macros.md)."
     * 
     * The following command opens the "mysound" device.
     * 
     * ``` syntax
     * open new type waveaudio alias mysound buffer 6
     * ```
     * 
     * With device name "new", the waveform driver prepares a new waveform resource. The command assigns the device alias "mysound" and specifies a 6-second buffer.
     * 
     * You can eliminate the "type" flag if you combine the device name with the filename. MCI recognizes this combination when you use the following syntax:
     * 
     * *device\_name* ! *element\_name*
     * 
     * The exclamation point separates the device name from the filename. The exclamation point should not be delimited by white spaces.
     * 
     * The following example opens the RIGHT.WAV file using the "waveaudio" device.
     * 
     * ``` syntax
     * open waveaudio!right.wav
     * ```
     * 
     * The MCIWAVE driver requires an asynchronous waveform-audio device.
     * @param {BSTR} bstrMethod 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT} varAsync 
     * @param {VARIANT} bstrUser 
     * @param {VARIANT} bstrPassword 
     * @returns {HRESULT} <span id="lpszDevice"></span><span id="lpszdevice"></span><span id="LPSZDEVICE"></span>*lpszDevice*
     * 
     * Identifier of an MCI device or device driver. This can be either a device name (as given in the registry or the SYSTEM.INI file) or the filename of the device driver. If you specify the filename of the device driver, you can optionally include the .DRV extension, but you should not include the path to the file.
     * 
     * 
     * <span id="lpszOpenFlags"></span><span id="lpszopenflags"></span><span id="LPSZOPENFLAGS"></span>*lpszOpenFlags*
     * 
     * Flag that identifies what to initialize. The following table lists device types that recognize the **open** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning                                                        | Meaning                                                                         |
     * |--------------|----------------------------------------------------------------|---------------------------------------------------------------------------------|
     * | cdaudio      | alias *device\_alias*sharable                                  | type *device\_type*                                                             |
     * | digitalvideo | alias *device\_aliaselementname*nostatic parent *hwnd*sharable | style child style overlapped style popup style *style\_type*type *device\_type* |
     * | overlay      | alias *device\_alias*parent *hwnd*sharable style child         | style overlapped style popup style *style\_type*type *device\_type*             |
     * | sequencer    | alias *device\_alias* sharable                                 | type *device\_type*                                                             |
     * | vcr          | alias *device\_alias*sharable                                  | type *device\_type*                                                             |
     * | videodisk    | alias *device\_alias*sharable                                  | type *device\_type*                                                             |
     * | waveaudio    | alias *device\_alias*buffer *buffer\_size*                     | sharable type *device\_type*                                                    |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszOpenFlags** parameter and their meanings.
     * 
     * 
     * 
     * | Value                 | Meaning                                                                                                                                                                                                                                                                                                                                                              |
     * |-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | alias *device\_alias* | Specifies an alternate name for the given device. If specified, it must be used as the *device\_id* in subsequent commands.                                                                                                                                                                                                                                          |
     * | *elementname*         | Specifies the name of the device element (file) loaded when the device opens.                                                                                                                                                                                                                                                                                        |
     * | buffer *buffer\_size* | Sets the size, in seconds, of the buffer used by the waveform-audio device. The default size of the buffer is set when the waveform-audio device is installed or configured. Typically the buffer size is set to 4 seconds. With the MCIWAVE device, the minimum size is 2 seconds and the maximum size is 9 seconds.                                                |
     * | parent *hwnd*         | Specifies the window handle of the parent window.                                                                                                                                                                                                                                                                                                                    |
     * | sharable              | Initializes the device or file as sharable. Subsequent attempts to open the device or file fail unless you specify "sharable" in both the original and subsequent **open** commands. MCI returns an invalid device error if the device is already open and not sharable.<br/> The MCISEQ sequencer and MCIWAVE devices do not support shared files.<br/> |
     * | style child           | Opens a window with a child window style.                                                                                                                                                                                                                                                                                                                            |
     * | style overlapped      | Opens a window with an overlapped window style.                                                                                                                                                                                                                                                                                                                      |
     * | style popup           | Opens a window with a pop-up window style.                                                                                                                                                                                                                                                                                                                           |
     * | style *style\_type*   | Indicates a window style.                                                                                                                                                                                                                                                                                                                                            |
     * | type *device\_type*   | Specifies the device type of a file.                                                                                                                                                                                                                                                                                                                                 |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/open
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
     * Sends data on a connected socket. (send)
     * @remarks
     * The 
     * <b>send</b> function is used to write outgoing data on a connected socket. 
     * 
     * For message-oriented sockets (address family of <b>AF_INET</b> or <b>AF_INET6</b>, type of <b>SOCK_DGRAM</b>, and protocol of <b>IPPROTO_UDP</b>, for example), care must be taken not to exceed the maximum packet size of the underlying provider. The maximum message packet size for a provider can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> with the <i>optname</i> parameter set to <b>SO_MAX_MSG_SIZE</b> to retrieve the value of socket option. If the data is too long to pass atomically through the underlying protocol, the error 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEMSGSIZE</a> is returned, and no data is transmitted.
     * 
     * The successful completion of a 
     * <b>send</b> function does not indicate that the data was successfully delivered and received to the recipient. This function only indicates the data was successfully sent. 
     * 
     * If no buffer space is available within the transport system to hold the data to be transmitted, 
     * <b>send</b> will block unless the socket has been placed in nonblocking mode. On nonblocking stream oriented sockets, the number of bytes written can be between 1 and the requested length, depending on buffer availability on both the client and server computers. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-select">select</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsaasyncselect">WSAAsyncSelect</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaeventselect">WSAEventSelect</a> functions can be used to determine when it is possible to send more data.
     * 
     * Calling 
     * <b>send</b> with a <i>len</i> parameter of zero is permissible and will be treated by implementations as successful. In such cases, 
     * <b>send</b> will return zero as a valid value. For message-oriented sockets, a zero-length transport datagram is sent.
     * 
     * The <i>flags</i> parameter can be used to influence the behavior of the function beyond the options specified for the associated socket. The semantics of the <b>send</b> function are determined by any options previously set on the socket specified in the <i>s</i> parameter and the <i>flags</i> parameter passed to the <b>send</b> function. 
     * 
     * The order of calls made to <b>send</b> is also the order in which the buffers are transmitted to the transport layer. <b>send</b> should not be called on the same stream-oriented socket concurrently from different threads, because some Winsock providers may split a large send request into multiple transmissions, and this may lead to unintended data interleaving from multiple concurrent send requests on the same stream-oriented socket.
     * 
     * <div class="alert"><b>Note</b>  When issuing a blocking Winsock call such as <b>send</b>, Winsock may need to wait for a network event before the call can complete. Winsock performs an alertable wait in this situation, which can be interrupted by an asynchronous procedure call (APC) scheduled on the same thread. Issuing another blocking Winsock call inside an APC that interrupted an ongoing blocking Winsock call on the same thread will lead to undefined behavior, and must never be attempted by Winsock clients. </div>
     * <div> </div>
     * <h3><a id="Example_Code"></a><a id="example_code"></a><a id="EXAMPLE_CODE"></a>Example Code</h3>
     * The following example demonstrates the use of the <b>send</b> function.
     * 
     * 
     * ```cpp
     * @param {VARIANT} varBody 
     * @returns {HRESULT} If no error occurs, 
     * <b>send</b> returns the total number of bytes sent, which can be less than the number requested to be sent in the <i>len</i> parameter. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> call must occur before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested address is a broadcast address, but the appropriate flag was not set. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> with the SO_BROADCAST socket option to enable use of the broadcast address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINTR</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Sockets 1.1 call was canceled through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsacancelblockingcall">WSACancelBlockingCall</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETRESET</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOBUFS</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTCONN</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOTSOCK</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEOPNOTSUPP</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAESHUTDOWN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket has been shut down; it is not possible to send on a socket after 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-shutdown">shutdown</a> has been invoked with <i>how</i> set to SD_SEND or SD_BOTH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEWOULDBLOCK</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEMSGSIZE</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEHOSTUNREACH</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket has not been bound with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a>, or an unknown flag was specified, or MSG_OOB was specified for a socket with SO_OOBINLINE enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAECONNABORTED</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAECONNRESET</a></b></dt>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAETIMEDOUT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has been dropped, because of a network failure or because the system on the other end went down without notice.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsock2/nf-winsock2-send
     */
    send(varBody) {
        result := ComCall(11, this, "ptr", varBody, "HRESULT")
        return result
    }

    /**
     * Submits an error message to the information queue and terminates the current draw or dispatch call being executed.
     * @remarks
     * This operation does nothing on rasterizers that do not support it.
     * @returns {HRESULT} None
     * 
     * 
     * 
     * This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/abort
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
