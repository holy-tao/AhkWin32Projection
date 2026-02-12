#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_wsarecvmsg
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_WSARECVMSG extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {SOCKET} s 
     * @param {Pointer<WSAMSG>} lpMsg 
     * @param {Pointer<Integer>} lpdwNumberOfBytesRecvd 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<LPWSAOVERLAPPED_COMPLETION_ROUTINE>} lpCompletionRoutine 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, lpMsg, lpdwNumberOfBytesRecvd, lpOverlapped, lpCompletionRoutine) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpdwNumberOfBytesRecvdMarshal := lpdwNumberOfBytesRecvd is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpMsg, lpdwNumberOfBytesRecvdMarshal, lpdwNumberOfBytesRecvd, "ptr", lpOverlapped, "ptr", lpCompletionRoutine, "int")
        return result
    }
}
