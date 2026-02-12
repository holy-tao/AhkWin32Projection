#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sends network data on a connected registered I/O TCP socket or a bound registered I/O UDP socket with additional options for use with the Winsock registered I/O extensions.
 * @remarks
 * An application can use the **RIOSendEx** function to send network data from any buffer completely contained within a single registered buffer. The **Offset** and **Length** members of the [**RIO\_BUF**](../mswsockdef/ns-mswsockdef-rio_buf.md) structure pointed to by the *pData* parameter determine the network data to be sent from the buffer.
 * 
 * The buffer associated with a send operation must not be used concurrently with another send or receive operation. The buffer, and buffer registration, must remain valid for the duration of a send operation. This means that you should not pass the same PRIO\_BUF to a RIOSend(Ex) request when one is already pending. Only after an in-flight RIOSend(Ex) request is complete should you re-use the same PRIO\_BUF (either with the same offset or with a different offset and length). Furthermore, when send data references a registered buffer (either a portion or the entire buffer), the entire registered buffer must not be used until the send has completed. This includes using a portion of the registered buffer for a receive operation or another send operation.
 * 
 * The *pLocalAddress* parameter can be used to retrieve the local address from which the data was sent. The *pRemoteAddress* parameter can be used to retrieve the remote address to which the data was sent. The local and remote addresses are returned as [**SOCKADDR\_INET**](../ws2ipdef/ns-ws2ipdef-sockaddr_inet.md) structures. As a result, the **Length** member of the [**RIO\_BUF**](../mswsockdef/ns-mswsockdef-rio_buf.md) pointed to by *pLocalAddress* or *pRemoteAddress* parameters should be equal or greater than the size of a **SOCKADDR\_INET** structure.
 * 
 * The following table summarizes the various uses of control data available for use with the control information in the *pControlContext* member.
 * 
 * 
 * 
 * | Protocol | cmsg\_level   | cmsg\_type     | Description                                                                                                                                                                                         |
 * |----------|---------------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | IPv4     | IPPROTO\_IP   | IP\_PKTINFO    | Specifies/receives packet information.<br/> For more information, see the [IPPROTO_IP Socket Options](/windows/win32/winsock/ipproto-ip-socket-options) for the IP\_PKTINFO socket option.<br/>       |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_DSTOPTS  | Specifies/receives destination options.<br/>                                                                                                                                                  |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_HOPLIMIT | Specifies/receives hop limit.<br/> For more information, see the [**IPPROTO\_IPV6 Socket Options**](/windows/win32/winsock/ipproto-ipv6-socket-options) for the IPV6\_HOPLIMIT socket option.<br/>         |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_HOPOPTS  | Specifies/receives hop-by-hop options.<br/>                                                                                                                                                   |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_NEXTHOP  | Specifies next-hop address.<br/>                                                                                                                                                              |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_PKTINFO  | Specifies/receives packet information.<br/> For more information, see the [**IPPROTO\_IPV6 Socket Options**](/windows/win32/winsock/ipproto-ipv6-socket-options) for the IPV6\_PKTINFO socket option.<br/> |
 * | IPv6     | IPPROTO\_IPV6 | IPV6\_RTHDR    | Specifies/receives routing header.<br/>                                                                                                                                                       |
 * 
 * 
 * 
 *  
 * 
 * Control data is made up of one or more control data objects, each beginning with a **WSACMSGHDR** structure, defined as the following:
 * 
 * 
 * ```C++
 * } WSACMSGHDR;
 * ```
 * 
 * 
 * 
 * The members of the **WSACMSGHDR** structure are as follows:
 * 
 * 
 * 
 * | Term                                                                             | Description                                                                                                                                                  |
 * |----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="cmsg_len"></span><span id="CMSG_LEN"></span>cmsg\_len<br/>       | The number of bytes of data starting from the beginning of the **WSACMSGHDR** to the end of data (excluding padding bytes that may follow data). <br/> |
 * | <span id="cmsg_level"></span><span id="CMSG_LEVEL"></span>cmsg\_level<br/> | The protocol that originated the control information. <br/>                                                                                            |
 * | <span id="cmsg_type"></span><span id="CMSG_TYPE"></span>cmsg\_type<br/>    | The protocol-specific type of control information.<br/>                                                                                                |
 * 
 * 
 * 
 *  
 * 
 * The *Flags* parameter can be used to influence the behavior of the **RIOSendEx** function beyond the options specified for the associated socket. The behavior of this function is determined by a combination of any socket options set on the socket associated with the *SocketQueue* parameter and the values specified in the *Flags* parameter.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOSendEx** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_riosendex
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIOSENDEX extends IUnknown {

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
     * @param {RIO_RQ} SocketQueue 
     * @param {Pointer<RIO_BUF>} pData 
     * @param {Integer} DataBufferCount 
     * @param {Pointer<RIO_BUF>} pLocalAddress 
     * @param {Pointer<RIO_BUF>} pRemoteAddress 
     * @param {Pointer<RIO_BUF>} pControlContext 
     * @param {Pointer<RIO_BUF>} pFlags 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} RequestContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SocketQueue, pData, DataBufferCount, pLocalAddress, pRemoteAddress, pControlContext, pFlags, Flags, RequestContext) {
        SocketQueue := SocketQueue is Win32Handle ? NumGet(SocketQueue, "ptr") : SocketQueue

        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", SocketQueue, "ptr", pData, "uint", DataBufferCount, "ptr", pLocalAddress, "ptr", pRemoteAddress, "ptr", pControlContext, "ptr", pFlags, "uint", Flags, RequestContextMarshal, RequestContext, "int")
        return result
    }
}
