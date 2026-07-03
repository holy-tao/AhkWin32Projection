#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPWSAOVERLAPPED_COMPLETION_ROUTINE.ahk" { LPWSAOVERLAPPED_COMPLETION_ROUTINE }
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSAMSG.ahk" { WSAMSG }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * \**LPFN_WSARECVMSG** is a function pointer type. You implement a matching **WSARecvMsg** callback function in your app. The system uses your callback function to transmit to you in-memory data, or file data, over a connected socket.
 * @remarks
 * The **WSARecvMsg** function can be used in place of the [**WSARecv**](../winsock2/nf-winsock2-wsarecv.md) and [**WSARecvFrom**](../winsock2/nf-winsock2-wsarecvfrom.md) functions to receive data and optional control information from connected and unconnected sockets. The **WSARecvMsg** function can only be used with datagrams and raw sockets. The socket descriptor in the *s* parameter must be opened with the socket type set to **SOCK\_DGRAM** or **SOCK\_RAW**.
 * 
 * **Note**  The function pointer for the **WSARecvMsg** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_WSARECVMSG**, a globally unique identifier (GUID) whose value identifies the **WSARecvMsg** extension function. On success, the output returned by the **WSAIoctl** function contains a pointer to the **WSARecvMsg** function. The **WSAID\_WSARECVMSG** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * The **dwFlags** member of the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure pointed to by the *lpMsg* parameter may only contain the **MSG\_PEEK** control flag on input.
 * 
 * Overlapped sockets are created with a [**WSASocket**](../winsock2/nf-winsock2-wsasocketa.md) function call that has the **WSA\_FLAG\_OVERLAPPED** flag set. For overlapped sockets, receiving information uses overlapped I/O unless both the *lpOverlapped* and *lpCompletionRoutine* parameters are **NULL**. The socket is treated as a non-overlapped socket when both the *lpOverlapped* and *lpCompletionRoutine* parameters are **NULL**.
 * 
 * A completion indication occurs with overlapped sockets. Once the buffer or buffers have been consumed by the transport, a completion routine is triggered or an event object is set. If the operation does not complete immediately, the final completion status is retrieved through the completion routine or by calling the [**WSAGetOverlappedResult**](../winsock2/nf-winsock2-wsagetoverlappedresult.md) function.
 * 
 * For overlapped sockets, **WSARecvMsg** is used to post one or more buffers into which incoming data will be placed as it becomes available, after which the application-specified completion indication (invocation of the completion routine or setting of an event object) occurs. If the operation does not complete immediately, the final completion status is retrieved through the completion routine or the [**WSAGetOverlappedResult**](../winsock2/nf-winsock2-wsagetoverlappedresult.md) function.
 * 
 * For non-overlapped sockets, the blocking semantics are identical to that of the standard [**recv**](../winsock/nf-winsock-recv.md) function and the *lpOverlapped* and *lpCompletionRoutine* parameters are ignored. Any data that has already been received and buffered by the transport will be copied into the specified user buffers. In the case of a blocking socket with no data currently having been received and buffered by the transport, the call will block until data is received. Windows Sockets 2 does not define any standard blocking time-out mechanism for this function. For protocols acting as byte-stream protocols the stack tries to return as much data as possible subject to the available buffer space and amount of received data available. However, receipt of a single byte is sufficient to unblock the caller. There is no guarantee that more than a single byte will be returned. For protocols acting as message-oriented, a full message is required to unblock the caller.
 * 
 * **Note**  The **SO\_RCVTIMEO** socket option applies only to blocking sockets.
 * 
 *  
 * 
 * The buffers are filled in the order in which they appear in the array pointed to by the **lpBuffers** member of the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure pointed to by the *lpMsg* parameter, and the buffers are packed so that no holes are created.
 * 
 * If this function is completed in an overlapped manner, it is the Winsock service provider's responsibility to capture this [**WSABUF**](../ws2def/ns-ws2def-wsabuf.md) structure before returning from this call. This enables applications to build stack-based **WSABUF** arrays pointed to by the **lpBuffers** member of the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure pointed to by the *lpMsg* parameter.
 * 
 * For message-oriented sockets (a socket type of **SOCK\_DGRAM** or **SOCK\_RAW**), an incoming message is placed into the buffers up to the total size of the buffers, and the completion indication occurs for overlapped sockets. If the message is larger than the buffers, the buffers are filled with the first part of the message and the excess data is lost, and **WSARecvMsg** generates the error WSAEMSGSIZE.
 * 
 * When the [IP\_PKTINFO](/windows/win32/WinSock/ip-pktinfo) socket option is enabled on an IPv4 socket of type **SOCK\_DGRAM** or **SOCK\_RAW**, the **WSARecvMsg** function returns packet information in the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure pointed to by the *lpMsg* parameter. One of the control data objects in the returned **WSAMSG** structure will contain an [**in\_pktinfo**](../ws2ipdef/ns-ws2ipdef-in_pktinfo.md) structure used to store received packet address information.
 * 
 * For datagrams received over IPv4, the **Control** member of the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure received will contain a [**WSABUF**](../ws2def/ns-ws2def-wsabuf.md) structure that contains a **WSACMSGHDR** structure. The **cmsg\_level** member of this **WSACMSGHDR** structure would contain **IPPROTO\_IP**, the **cmsg\_type** member of this structure would contain **IP\_PKTINFO**, and the **cmsg\_data** member would contain an [**in\_pktinfo**](../ws2ipdef/ns-ws2ipdef-in_pktinfo.md) structure used to store received IPv4 packet address information. The IPv4 address in the **in\_pktinfo** structure is the IPv4 address from which the packet was received.
 * 
 * When the [IPV6\_PKTINFO](/windows/win32/WinSock/ipv6-pktinfo) socket option is enabled on an IPv6 socket of type **SOCK\_DGRAM** or **SOCK\_RAW**, the **WSARecvMsg** function returns packet information in the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure pointed to by the *lpMsg* parameter. One of the control data objects in the returned **WSAMSG** structure will contain an [**in6\_pktinfo**](../ws2ipdef/ns-ws2ipdef-in6_pktinfo.md) structure used to store received packet address information.
 * 
 * For datagrams received over IPv6, the **Control** member of the [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure received will contain a [**WSABUF**](../ws2def/ns-ws2def-wsabuf.md) structure that contains a **WSACMSGHDR** structure. The **cmsg\_level** member of this **WSACMSGHDR** structure would contain **IPPROTO\_IPV6**, the **cmsg\_type** member of this structure would contain **IPV6\_PKTINFO**, and the **cmsg\_data** member would contain an [**in6\_pktinfo**](../ws2ipdef/ns-ws2ipdef-in6_pktinfo.md) structure used to store received IPv6 packet address information. The IPv6 address in the **in6\_pktinfo** structure is the IPv6 address from which the packet was received.
 * 
 * For a dual-stack datagram socket, if an application requires the **WSARecvMsg** function to return packet information in a [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure for datagrams received over IPv4, then [IP\_PKTINFO](/windows/win32/WinSock/ip-pktinfo) socket option must be set to true on the socket. If only the [IPV6\_PKTINFO](/windows/win32/WinSock/ipv6-pktinfo) option is set to true on the socket, packet information will be provided for datagrams received over IPv6 but may not be provided for datagrams received over IPv4.
 * 
 * Note that the *Ws2ipdef.h* header file is automatically included in *Ws2tcpip.h*, and should never be used directly.
 * 
 * **Note**   All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. For more information, see [**ExitThread**](../processthreadsapi/nf-processthreadsapi-exitthread.md).
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_wsarecvmsg
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_WSARECVMSG {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_WSARECVMSG) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Type: \_In\_ **SOCKET**
     * 
     * A descriptor that identifies the socket.
     * @param {Pointer<WSAMSG>} lpMsg Type: \_Inout\_ **[LPWSAMSG](../ws2def/ns-ws2def-wsamsg.md)**
     * 
     * A pointer to a [**WSAMSG**](../ws2def/ns-ws2def-wsamsg.md) structure based on the Posix.1g specification for the msghdr structure.
     * @param {Pointer<Integer>} lpdwNumberOfBytesRecvd Type: \_Out_opt\_ **[LPDWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to a **DWORD** containing number of bytes received by this call if the **WSARecvMsg** operation completes immediately.
     * 
     * To avoid potentially erroneous results, pass **NULL** for this parameter if the *lpOverlapped* parameter is not **NULL** . This parameter can be **NULL** only if the *lpOverlapped* parameter is not **NULL**.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Type: \_Inout_opt\_ **[LPWSAOVERLAPPED](../winsock2/ns-winsock2-wsaoverlapped.md)**
     * 
     * A pointer to a [**WSAOVERLAPPED**](../winsock2/ns-winsock2-wsaoverlapped.md) structure. Ignored for non-overlapped structures.
     * @param {Pointer<LPWSAOVERLAPPED_COMPLETION_ROUTINE>} lpCompletionRoutine Type: \_In_opt\_ [**LPWSAOVERLAPPED_COMPLETION_ROUTINE**](../winsock2/nc-winsock2-lpwsaoverlapped_completion_routine.md)
     * 
     * A pointer to the completion routine called when the receive operation completes. Ignored for non-overlapped structures.
     * @returns {Integer} If no error occurs and the receive operation has completed immediately, **WSARecvMsg** returns zero. In this case, the completion routine will have already been scheduled to be called once the calling thread is in the alertable state. Otherwise, a value of SOCKET\_ERROR is returned, and a specific error code can be retrieved by calling [**WSAGetLastError**](../winsock/nf-winsock-wsagetlasterror.md). The error code **WSA\_IO\_PENDING** indicates that the overlapped operation has been successfully initiated and that completion will be indicated at a later time.
     * 
     * Any other error code indicates that the operation was not successfully initiated and no completion indication will occur if an overlapped operation was requested.
     * 
     * <table>
     * <colgroup>
     * <col />
     * <col />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAECONNRESET</a></strong></td>
     * <td><p>For a UDP datagram socket, this error would indicate that a previous send operation resulted in an ICMP &quot;Port Unreachable&quot; message.</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEFAULT</a></strong></td>
     * <td><p>The <em>lpBuffers</em>, <em>lpFlags</em>, <em>lpFrom</em>, <em>lpNumberOfBytesRecvd</em>, <em>lpFromlen</em>, <em>lpOverlapped</em>, or <em>lpCompletionRoutine</em> parameter is not totally contained in a valid part of the user address space: the <em>lpFrom</em> buffer was too small to accommodate the peer address. This error is also returned if a <strong>name</strong> member of the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsamsg"><strong>WSAMSG</strong></a> structure pointed to by the <em>lpMsg</em> parameter was a <strong>NULL</strong> pointer and the <strong>namelen</strong> member of the <strong>WSAMSG</strong> structure was not set to zero. This error is also returned if a <strong>Control.buf</strong> member of the <strong>WSAMSG</strong> structure pointed to by the <em>lpMsg</em> parameter was a <strong>NULL</strong> pointer and the <strong>Control.len</strong> member of the <strong>WSAMSG</strong> structure was not set to zero.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></strong></td>
     * <td><p>A blocking Windows Sockets 1.1 call is in progress, or the service provider is still processing a callback function.</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEINTR</a></strong></td>
     * <td><p>A blocking Windows Socket 1.1 call was canceled through <a href="https://docs.microsoft.com/windows/win32/api/winsock2/nf-winsock2-wsacancelblockingcall">WSACancelBlockingCall</a>.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEINVAL</a></strong></td>
     * <td><p>The socket has not been bound (with <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-bind"><strong>bind</strong></a>, for example).</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEMSGSIZE</a></strong></td>
     * <td><p>The message was too large to fit into the specified buffer and (for unreliable protocols only) any trailing portion of the message that did not fit into the buffer has been discarded.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAENETDOWN</a></strong></td>
     * <td><p>The network subsystem has failed.</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAENETRESET</a></strong></td>
     * <td><p>For a datagram socket, this error indicates that the time to live has expired.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAENOTCONN</a></strong></td>
     * <td><p>The socket is not connected (connection-oriented sockets only).</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAETIMEDOUT</a></strong></td>
     * <td><p>The socket timed out. This error is returned if the socket had a wait timeout specified using the <strong>SO_RCVTIMEO</strong> socket option and the timeout was exceeded.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEOPNOTSUPP</a></strong></td>
     * <td><p>The socket operation is not supported. This error is returned if the <strong>dwFlags</strong> member of the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsamsg"><strong>WSAMSG</strong></a> structure pointed to by the <em>lpMsg</em> parameter includes the <strong>MSG_PEEK</strong> control flag on a non-datagram socket.</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSAEWOULDBLOCK</a></strong></td>
     * <td><p><strong>Windows NT:  </strong></p>
     * <p>Overlapped sockets: There are too many outstanding overlapped I/O requests. Non-overlapped sockets: The socket is marked as nonblocking and the receive operation cannot be completed immediately.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></strong></td>
     * <td><p>A successful <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-wsastartup"><strong>WSAStartup</strong></a> call must occur before using this function.</p></td>
     * </tr>
     * <tr class="even">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSA_IO_PENDING</a></strong></td>
     * <td><p>An overlapped operation was successfully initiated and completion will be indicated at a later time.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><strong><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2">WSA_OPERATION_ABORTED</a></strong></td>
     * <td><p>The overlapped operation has been canceled due to the closure of the socket.</p></td>
     * </tr>
     * </tbody>
     * </table>
     */
    Call(s, lpMsg, lpdwNumberOfBytesRecvd, lpOverlapped, lpCompletionRoutine) {
        lpdwNumberOfBytesRecvdMarshal := lpdwNumberOfBytesRecvd is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SOCKET, s, WSAMSG.Ptr, lpMsg, lpdwNumberOfBytesRecvdMarshal, lpdwNumberOfBytesRecvd, OVERLAPPED.Ptr, lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE, lpCompletionRoutine, Int32)
        return result
    }

    /**
     * A LPFN_WSARECVMSG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_WSARECVMSG {
        /**
         * Creates a LPFN_WSARECVMSG pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, WSAMSG, "uint*", OVERLAPPED, LPWSAOVERLAPPED_COMPLETION_ROUTINE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, WSAMSG.Ptr, "uint*", OVERLAPPED.Ptr, LPWSAOVERLAPPED_COMPLETION_ROUTINE, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
