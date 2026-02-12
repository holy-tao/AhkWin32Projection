#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPConnect function establishes a connection to a peer, exchanges connect data, and specifies needed quality of service based on the supplied flow specification.
 * @remarks
 * This function is used to create a connection to the specified destination and to perform a number of other ancillary operations that occur at connect time as well. If the socket, <i>s</i>, is unbound, unique values are assigned to the local association by the system and the socket is marked as bound.
 * 
 * For connection-oriented sockets (for example, type SOCK_STREAM), an active connection is initiated to the specified host using <i>name</i> (an address in the namespace of the socket. For a detailed description, see <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b>. When this call completes successfully, the socket is ready to send and receive data. If the address member of the **name** structure is all zeroes, **LPWSPConnect** will return the error <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEADDRNOTAVAIL">WSAEADDRNOTAVAIL</a>. Any attempt to reconnect an active connection will fail with the error code <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEISCONN">WSAEISCONN</a>.
 * 
 * For connection-oriented, nonblocking sockets it is often not possible to complete the connection immediately. In such a case, this function returns with the error <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEWOULDBLOCK">WSAEWOULDBLOCK</a> but the operation proceeds. When the success or failure outcome becomes known, it may be reported in one of several ways depending on how the client registers for notification. If the client uses <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspselect">LPWSPSelect</a></b>, success is reported in the <i>writefds</i> set and failure is reported in the <i>exceptfds</i> set. If the client uses **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspeventselect">LPWSPEventSelect</a></b>, the notification is announced with FD_CONNECT and the error code associated with the FD_CONNECT indicates either success or a specific reason for failure.
 * 
 * For a connectionless socket (for example, type SOCK_DGRAM), the operation performed by **LPWSPConnect** is to establish a default destination address so the socket can be used with subsequent connection-oriented send and receive operations (<b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b>, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>). Any datagrams received from an address other than the destination address specified will be discarded. If the address member of the <i>name</i> structure is all zeroes, the socket will be disconnected— the default remote address will be indeterminate, so **LPWSPSend** and **LPWSPRecv** calls will return the error code <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTCONN">WSAENOTCONN</a>. However, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> and <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b> can still be used. The default destination can be changed by simply calling **LPWSPConnect** again, even if the socket is already connected. Any datagrams queued for receipt are discarded if <i>name</i> is different from the previous **LPWSPConnect**.
 * 
 * For connectionless sockets, <i>name</i> can indicate any valid address, including a broadcast address. However, to connect to a broadcast address, a socket must have <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/network/ff566318(v=vs.85)">WSPSetSockOpt</a></b> SO_BROADCAST enabled. Otherwise, **LPWSPConnect** will fail with the error code <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEACCES">WSAEACCES</a>.
 * 
 * On connectionless sockets, exchange of user-to-user data is not possible and the corresponding parameters will be silently ignored.
 * 
 * The Winsock SPI client is responsible for allocating any memory space pointed to directly or indirectly by any of the parameters it specifies.
 * 
 * The <i>lpCallerData</i> is a value parameter that contains any user data to be sent along with the connection request. If <i>lpCallerData</i> is null, no user data will be passed to the peer. The <i>lpCalleeData</i> is a result parameter that will reference any user data passed back from the peer as part of the connection establishment. The <i>lpCalleeData</i>-&gt;**len** initially contains the length of the buffer allocated by the Winsock SPI client and pointed to by <i>lpCalleeData</i>-&gt;**buf**. The <i>lpCalleeData</i>-&gt;**len** will be set to zero if no user data has been passed back. The <i>lpCalleeData</i> information will be valid when the connection operation is complete. For blocking sockets, this will be when the **LPWSPConnect** function returns. For nonblocking sockets, this will be after the FD_CONNECT notification has occurred. If <i>lpCalleeData</i> is null, no user data will be passed back. The exact format of the user data is specific to the address family the socket belongs to and/or the applications involved.
 * 
 * At connect time, a Winsock SPI client can use the <i>lpSQOS</i> parameter to override any previous QoS specification made for the socket through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspioctl">LPWSPIoctl</a></b> with the SIO_SET_QOS opcode.
 * 
 * The <i>lpSQOS</i> specifies the flow specifications for socket <i>s</i>, one for each direction, followed by any additional provider-specific parameters. If either the associated transport provider in general or the specific type of socket in particular cannot honor the QoS request, an error will be returned as indicated below. The sending or receiving flow specification values will be ignored, respectively, for any unidirectional sockets. If no provider-specific parameters are supplied, the **buf** and **len** members of <i>lpSQOS</i>-&gt;**ProviderSpecific** should be set to null and zero, respectively. A null value for <i>lpSQOS</i> indicates that no application supplied quality of service.
 * 
 * > [!Note]  
 * > When connected sockets break (that is, become closed for whatever reason), they should be discarded and recreated. It is safest to assume that when things go awry for any reason on a connected socket, the Winsock SPI client must discard and recreate the needed sockets in order to return to a stable point.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspconnect
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPCONNECT extends IUnknown {

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
     * @param {Pointer} name 
     * @param {Integer} namelen 
     * @param {Pointer<WSABUF>} lpCallerData 
     * @param {Pointer<WSABUF>} lpCalleeData 
     * @param {Pointer<QOS>} lpSQOS 
     * @param {Pointer<QOS>} lpGQOS 
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
    Invoke(s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", name, "int", namelen, "ptr", lpCallerData, "ptr", lpCalleeData, "ptr", lpSQOS, "ptr", lpGQOS, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
