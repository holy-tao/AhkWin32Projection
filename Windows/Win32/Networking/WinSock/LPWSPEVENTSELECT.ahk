#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **LPWSPEventSelect** function specifies an event object to be associated with the supplied set of network events.
 * @remarks
 * This function is used to specify an event object, *hEventObject*, to be associated with the selected network events, *lNetworkEvents*. The socket for which an event object is specified is identified by *s*. The event object is set when any of the nominated network events occur.
 * 
 * **LPWSPEventSelect** operates very similarly to **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)**, the difference being in the actions taken when a nominated network event occurs. Whereas **WSPAsyncSelect** causes a Windows Sockets SPI client-specified Windows message to be posted, **LPWSPEventSelect** sets the associated event object and records the occurrence of this event in an internal network event record. A Windows Sockets SPI client can use **[LPWSPEnumNetworkEvents](./nc-ws2spi-lpwspenumnetworkevents.md)** to retrieve the contents of the internal network event record, and thus determine which of the nominated network events have occurred.
 * 
 * **LPWSPEventSelect** is the only function that causes network activity and errors to be recorded and retrievable through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspenumnetworkevents">LPWSPEnumNetworkEvents</a></b>. See the descriptions of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspselect">LPWSPSelect</a></b> and **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** to find out how those functions report network activity and errors.
 * 
 * This function automatically sets socket *s* to nonblocking mode, regardless of the value of *lNetworkEvents*.
 * 
 * Issuing an **LPWSPEventSelect** for a socket cancels any previous **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** or **LPWSPEventSelect** for the same socket, and clears the internal network event record. For example, to associate an event object with both reading and writing network events, the Windows Sockets SPI client must call **LPWSPEventSelect** with both FD_READ and FD_WRITE, like this.
 * 
 * ```cpp
 * rc = WSPEventSelect(s, hEventObject, FD_READ | FD_WRITE);
 * ```
 * 
 * It's not possible to specify different event objects for different network events. The following code won't work; the second call cancels the effects of the first, and the only association will be the FD_WRITE network event associated with hEventObject2.
 * 
 * ```cpp
 * // Incorrect example.
 * rc = WSPEventSelect(s, hEventObject1, FD_READ);
 * rc = WSPEventSelect(s, hEventObject2, FD_WRITE);
 * ```
 * 
 * To cancel the association and selection of network events on a socket, you should set *lNetworkEvents* to zero, in which case the *hEventObject* parameter is ignored.
 * 
 * ```cpp
 * rc = WSPEventSelect(s, hEventObject, 0);
 * ```
 * 
 * Closing a socket with **[LPWSPCloseSocket](./nc-ws2spi-lpwspclosesocket.md)** also cancels the association and selection of network events specified in **LPWSPEventSelect** for the socket. The Windows Sockets SPI client, however, still must call **[WSACloseEvent](../winsock2/nf-winsock2-wsacloseevent.md)** to explicitly close the event object, and free any resources.
 * 
 * Since an **[LPWSPAccept](./nc-ws2spi-lpwspaccept.md)**'ed socket has the same properties as the listening socket used to accept it, any **LPWSPEventSelect** association and network events selection set for the listening socket apply to the accepted socket. For example, if a listening socket has **LPWSPEventSelect** association of *hEventObject* with FD_ACCEPT, FD_READ, and FD_WRITE, then any socket accepted on that listening socket will also have FD_ACCEPT, FD_READ, and FD_WRITE network events associated with the same *hEventObject*. If a different *hEventObject* or network events are desired, then the Windows Sockets SPI client should call **LPWSPEventSelect**, passing the accepted socket, and the desired new information.
 * 
 * Having successfully recorded the occurrence of the network event and signaled the associated event object, no further actions are taken for that network event until the Windows Sockets SPI client makes the function call that implicitly re-enables the setting of that network event and signaling of the associated event object.
 * 
 * |Network event|Re-enabling function|
 * |-|-|
 * |FD_READ|[LPWSPRecv](./nc-ws2spi-lpwsprecv.md) or [LPWSPRecvFrom](./nc-ws2spi-lpwsprecvfrom.md)|
 * |FD_WRITE|[LPWSPSend](./nc-ws2spi-lpwspsend.md) or [LPWSPSendTo](./nc-ws2spi-lpwspsendto.md)|
 * |FD_OOB|[LPWSPRecv](./nc-ws2spi-lpwsprecv.md) or [LPWSPRecvFrom](./nc-ws2spi-lpwsprecvfrom.md)|
 * |FD_ACCEPT|[LPWSPAccept](./nc-ws2spi-lpwspaccept.md), unless the error code returned is WSATRY_AGAIN indicating that the condition function returned CF_DEFER|
 * |FD_CONNECT|NONE|
 * |FD_CLOSE|NONE|
 * |FD_QOS|[LPWSPIoctl](./nc-ws2spi-lpwspioctl.md) with SIO_GET_QOS|
 * |FD_GROUP_QOS|Reserved for future use with socket groups: [LPWSPIoctl](./nc-ws2spi-lpwspioctl.md) with SIO_GET_GROUP_QOS|
 * |FD_ROUTING_INTERFACE_CHANGE|[LPWSPIoctl](./nc-ws2spi-lpwspioctl.md) with command SIO_ROUTING_INTERFACE_CHANGE|
 * |FD_ADDRESS_LIST_CHANGE|[LPWSPIoctl](./nc-ws2spi-lpwspioctl.md) with command SIO_ADDRESS_LIST_CHANGE|
 * 
 * Any call to the re-enabling routine, even one that fails, results in re-enabling of recording and signaling for the relevant network event and event object, respectively.
 * 
 * For FD_READ, FD_OOB, and FD_ACCEPT network events, network event recording and event object signaling are *level-triggered*. This means that if the re-enabling routine is called, and the relevant network condition is still valid after the call, then the network event is recorded and the associated event object is signaled. This allows a Windows Sockets SPI client to be event-driven while also being unconcerned with the amount of data that arrives at any one time. Consider the following sequence.
 * 
 * 1. The service provider receives 100 bytes of data on socket *s*, records the FD_READ network event, and signals the associated event object.
 * 2. The Windows Sockets SPI client issues `WSPRecv(s, buffptr, 50, 0)` to read 50 bytes.
 * 3. The service provider records the FD_READ network event, and signals the associated event object again since there is still data to be read.
 * 
 * With these semantics, a Windows Sockets SPI client need not read all available data in response to an FD_READ network event. Rather, a single [LPWSPRecv](./nc-ws2spi-lpwsprecv.md) in response to each FD_READ network event is appropriate.
 * 
 * The FD_QOS and FD_GROUP_QOS events are considered *edge-triggered*. A message will be posted exactly once when a quality of service (QOS) change occurs. Further indications won't be issued until either the service provider detects a further change in QOS, or the Windows Sockets SPI client renegotiates the QOS for the socket.
 * 
 * The FD_ROUTING_INTERFACE_CHANGE and FD_ADDRESS_LIST_CHANGE events are considered *edge-triggered* as well. A message will be posted exactly once when a change occurs *after* the Windows Sockets SPI client has request the notification by issuing [WSAIoctl](../winsock2/nf-winsock2-wsaioctl.md) with SIO_ROUTING_INTERFACE_CHANGE or SIO_ADDRESS_LIST_CHANGE correspondingly. Further messages won't be forthcoming until the Windows Sockets SPI client reissues the IOCTL *and* another change is detected since the IOCTL was issued.
 * 
 * If a network event has already happened when the Windows Sockets SPI client calls **LPWSPEventSelect**, or when the re-enabling function is called, then a network event is recorded and the associated event object is signaled, as appropriate. For example, consider the following sequence.
 * 
 * 1. A Windows Sockets SPI client calls [LPWSPListen](./nc-ws2spi-lpwsplisten.md).
 * 2. A connect request is received, but not yet accepted.
 * 3. The Windows Sockets SPI client calls **LPWSPEventSelect** specifying that it is interested in the FD_ACCEPT network event for the socket. The service provider records the FD_ACCEPT network event, and signals the associated event object immediately.
 * 
 * The FD_WRITE network event is handled slightly differently. An FD_WRITE network event is recorded when a socket is first connected with [LPWSPConnect](./nc-ws2spi-lpwspconnect.md) or accepted with [LPWSPAccept](./nc-ws2spi-lpwspaccept.md), and then after an [LPWSPSend](./nc-ws2spi-lpwspsend.md) or [LPWSPSendTo](./nc-ws2spi-lpwspsendto.md) fails with WSAEWOULDBLOCK and buffer space becomes available. Therefore, a Windows Sockets SPI client can assume that sends are possible starting from the first FD_WRITE network event setting, and lasting until a send returns WSAEWOULDBLOCK. After such a failure, the Windows Sockets SPI client will find that sends are again possible when an FD_WRITE network event is recorded and the associated event object is signaled.
 * 
 * The FD_OOB network event is used only when a socket is configured to receive out-of-band data separately. If the socket is configured to receive out-of-band data in-line, then the out-of-band (expedited) data is treated as normal data, and the Windows Sockets SPI client should register an interest in, and will get, FD_READ network event, not FD_OOB network event. A Windows Sockets SPI client may set or inspect the way in which out-of-band data is to be handled by using [LPWSPSetSockOpt](./nc-ws2spi-lpwspsetsockopt.md) or [LPWSPGetSockOpt](./nc-ws2spi-lpwspgetsockopt.md) for the SO_OOBINLINE option.
 * 
 * The error code in an FD_CLOSE network event indicates whether the socket close was graceful, or abortive. If the error code is 0, then the close was graceful; if the error code is WSAECONNRESET, then the socket's virtual circuit was reset. This applies only to connection-oriented sockets such as SOCK_STREAM. 
 * 
 * The FD_CLOSE network event is recorded when a close indication is received for the virtual circuit corresponding to the socket. In TCP terms, this means that the FD_CLOSE is recorded when the connection goes into the FIN WAIT or CLOSE WAIT states. This results from the remote end performing an [LPWSPShutdown](./nc-ws2spi-lpwspshutdown.md) on the send side, or an [LPWSPCloseSocket](./nc-ws2spi-lpwspclosesocket.md).
 * 
 * A service providers should record *only* an FD_CLOSE network event to indicate closure of a virtual circuit; it should *not* record an FD_READ network event to indicate that condition.
 * 
 * The FD_QOS or FD_GROUP_QOS network event is recorded when there has been a change to any field in the flow spec associated with socket *s*, or the socket group that *s* belongs to, respectively. This change must be made available to Windows Sockets SPI clients via the [LPWSPIoctl](./nc-ws2spi-lpwspioctl.md) function with SIO_GET_QOS and/or SIO_GET_GROUP_QOS to retrieve the current QOS for socket *s*, or for the socket group *s* belongs to, respectively.
 * 
 * The FD_ROUTING_INTERFACE_CHANGE network event is recorded when the local interface that should be used to reach the destination specified in [WSAIoctl](../winsock2/nf-winsock2-wsaioctl.md) with SIO_ROUTING_INTERFACE_CHANGE changes *after* such IOCTL has been issued.
 * 
 * The FD_ADDRESS_LIST_CHANGE network event is recorded when the list of addresses of sockets' protocol family to which the Windows Sockets SPI client can bind changes *after* [WSAIoctl](../winsock2/nf-winsock2-wsaioctl.md) with SIO_ADDRESS_LIST_CHANGE has been issued.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspeventselect
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPEVENTSELECT extends IUnknown {

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
     * @param {WSAEVENT} hEventObject 
     * @param {Integer} lNetworkEvents 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, hEventObject, lNetworkEvents, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s
        hEventObject := hEventObject is Win32Handle ? NumGet(hEventObject, "ptr") : hEventObject

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", hEventObject, "int", lNetworkEvents, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
