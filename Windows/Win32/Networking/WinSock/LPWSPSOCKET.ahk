#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSAPROTOCOL_INFOW.ahk" { WSAPROTOCOL_INFOW }

/**
 * The LPWSPSocket function creates a socket.
 * @remarks
 * The **LPWSPSocket** function causes a socket descriptor and any related resources to be allocated. By default, the created socket will not have the overlapped attribute. Windows Sockets providers are encouraged to be realized as Windows installable file systems, and supply system file handles as socket descriptors. These providers must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpumodifyifshandle">WPUModifyIFSHandle</a> prior to returning from this function. For nonfile-system Windows Sockets providers, 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">WPUCreateSocketHandle</a> must be used to acquire a unique socket descriptor from the Ws2_32.dll prior to returning from this function. See  
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/descriptor-allocation-2">Descriptor Allocation</a> for more information.
 * 
 * The values for <i>af</i>, <i>type</i>, and <i>protocol</i> are those supplied by the application in the corresponding API functions 
 * [socket](/windows/desktop/api/winsock2/nf-winsock2-socket) or 
 * [WSASocket](/windows/desktop/api/winsock2/nf-winsock2-wsasocketa). A service provider is free to ignore or pay attention to any or all of these values as is appropriate for the particular protocol. However, the provider must be willing to accept the value of zero for <i>af</i> and <i>type</i>, since the Ws2_32.dll considers these to be wildcard values. Also the value of manifest constant **FROM_PROTOCOL_INFO** must be accepted for any of <i>af</i>, <i>type</i>, and <i>protocol</i>. This value indicates that the Windows Sockets 2 application needs to use the corresponding values from the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure (**iAddressFamily**, **iSocketType**, **iProtocol**).
 * 
 * The <i>dwFlags</i> parameter can be used to specify the attributes of the socket by using the bitwise OR operator with any of the following flags.
 * 
 * |Flag|Meaning|
 * |-|-|
 * |WSA_FLAG_OVERLAPPED|This flag causes an overlapped socket to be created. Overlapped sockets can utilize [LPWSPSend](nc-ws2spi-lpwspsend.md), [LPWSPSendTo](nc-ws2spi-lpwspsendto.md), [LPWSPRecv](nc-ws2spi-lpwsprecv.md), [LPWSPRecvFrom](nc-ws2spi-lpwsprecvfrom.md), and [LPWSPIoctl](nc-ws2spi-lpwspioctl.md) for overlapped I/O operations, which allow multiple operations to be initiated and in process simultaneously. All functions that allow overlapped operations also support nonoverlapped usage on an overlapped socket if the values for parameters related to overlapped operation are null.|
 * |WSA_FLAG_MULTIPOINT_C_ROOT|Indicates that the socket created will be a c_root in a multipoint session. Only allowed if a rooted control plane is indicated in the protocol's <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure.|
 * |WSA_FLAG_MULTIPOINT_C_LEAF|Indicates that the socket created will be a c_leaf in a multicast session. Only allowed if XP1_SUPPORT_MULTIPOINT is indicated in the protocol's <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure.|
 * |WSA_FLAG_MULTIPOINT_D_ROOT|Indicates that the socket created will be a d_root in a multipoint session. Only allowed if a rooted data plane is indicated in the protocol's <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure.|
 * |WSA_FLAG_MULTIPOINT_D_LEAF|Indicates that the socket created will be a d_leaf in a multipoint session. Only allowed if XP1_SUPPORT_MULTIPOINT is indicated in the protocol's <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure.|
 * 
 * > [!NOTE]
 * > For multipoint sockets, exactly one WSA_FLAG_MULTIPOINT_C_ROOT or WSA_FLAG_MULTIPOINT_C_LEAF must be specified, and exactly one of WSA_FLAG_MULTIPOINT_D_ROOT or WSA_FLAG_MULTIPOINT_D_LEAF must be specified. Refer to <a href="https://docs.microsoft.com/windows/desktop/WinSock/protocol-independent-multicast-and-multipoint-in-the-spi-2">Protocol-Independent Multicast and Multipoint in the SPI</a> for additional information.
 * 
 * Connection-oriented sockets such as SOCK_STREAM provide full-duplex connections, and must be in a connected state before any data can be sent or received on them. A connection to another socket is created with a 
 * [LPWSPConnect](nc-ws2spi-lpwspconnect.md) call. Once connected, data can be transferred using 
 * [LPWSPSend](nc-ws2spi-lpwspsend.md) and 
 * [LPWSPRecv](nc-ws2spi-lpwsprecv.md) calls. When a session has been completed, a 
 * [LPWSPCloseSocket](nc-ws2spi-lpwspclosesocket.md) must be performed.
 * 
 * The communications protocols used to implement a reliable, connection-oriented socket ensure that data is not lost or duplicated. If data for which the peer protocol has buffer space cannot be successfully transmitted within a reasonable length of time, the connection is considered broken and subsequent calls will fail with the error code set to <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAETIMEDOUT</a>.
 * 
 * Connectionless, message-oriented sockets allow sending and receiving of datagrams to and from arbitrary peers using 
 * [LPWSPSendTo](nc-ws2spi-lpwspsendto.md) and 
 * [LPWSPRecvFrom](nc-ws2spi-lpwsprecvfrom.md). If such a socket is connected by using 
 * [LPWSPConnect](nc-ws2spi-lpwspconnect.md) to a specific peer, datagrams can be sent to that peer using 
 * [LPWSPSend](nc-ws2spi-lpwspsend.md) and can be received from (only) this peer using 
 * [LPWSPRecv](nc-ws2spi-lpwsprecv.md).
 * 
 * Support for sockets with type **SOCK RAW** is not required but service providers are encouraged to support raw sockets whenever it makes sense to do so.
 * 
 * A layered service provider supplies an implementation of this function, but it is also a client of this function if and when it calls 
 * **LPWSPSocket** of the next layer in the protocol chain. Some special considerations apply to this function's <i>lpProtocolInfo</i> parameter as it is propagated down through the layers of the protocol chain.
 * 
 * If the next layer in the protocol chain is another layer then when the next layer's 
 * **LPWSPSocket** is called, this layer must pass to the next layer a <i>lpProtocolInfo</i> that references the same unmodified 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure with the same unmodified chain information. However, if the next layer is the base protocol (that is, the last element in the chain), this layer performs a substitution when calling the base provider's 
 * **LPWSPSocket**. In this case, the base provider's 
 * **WSAPROTOCOL_INFO** structure should be referenced by the <i>lpProtocolInfo</i> parameter.
 * 
 * One vital benefit of this policy is that base service providers do not have to be aware of protocol chains.
 * 
 * This same propagation policy applies when propagating a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure through a layered sequence of other functions such as 
 * [LPWSPAddressToString](nc-ws2spi-lpwspaddresstostring.md), 
 * [LPWSPDuplicateSocket](nc-ws2spi-lpwspduplicatesocket.md), 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a>, or 
 * [LPWSPStringToAddress](nc-ws2spi-lpwspstringtoaddress.md).
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSOCKET {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSOCKET) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} af Address family specification.
     * @param {Integer} type Type specification for the new socket.
     * @param {Integer} protocol Protocol to be used with the socket that is specific to the indicated address family.
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure that defines the characteristics of the socket to be created.
     * @param {Integer} g Reserved.
     * @param {Integer} dwFlags Socket attribute specification.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {SOCKET} If no error occurs, 
     * **LPWSPSocket** returns a descriptor referencing the new socket. Otherwise, a value of INVALID_SOCKET is returned, and a specific error code is available in <i>lpErrno</i>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dl>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEAFNOSUPPORT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address family is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINPROGRESS</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking Windows Sockets call is in progress, or the service provider is still processing a callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEMFILE</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * No more socket descriptors are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENOBUFS</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * No buffer space is available. The socket cannot be created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEPROTONOSUPPORT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified protocol is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEPROTOTYPE</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified protocol is the wrong type for this socket.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAESOCKTNOSUPPORT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified socket type is not supported in this address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>g</i> specified is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * <div> </div>
     */
    Call(af, type, protocol, lpProtocolInfo, g, dwFlags, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Int32, af, Int32, type, Int32, protocol, WSAPROTOCOL_INFOW.Ptr, lpProtocolInfo, UInt32, g, UInt32, dwFlags, lpErrnoMarshal, lpErrno, SOCKET.Owned)
        return result
    }

    /**
     * A LPWSPSOCKET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSOCKET {
        /**
         * Creates a LPWSPSOCKET pointer that invokes the given AHK function when called.
         * @param {Func(Int32, Int32, Int32, WSAPROTOCOL_INFOW, UInt32, UInt32, "int*") => SOCKET} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, Int32, Int32, WSAPROTOCOL_INFOW.Ptr, UInt32, UInt32, "int*", SOCKET])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
