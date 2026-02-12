#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SOCKET.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPJoinLeaf function joins a leaf node into a multipoint session, exchanges connect data, and specifies needed quality of service based on the supplied flow specifications.
 * @remarks
 * This function is used to join a leaf node to a multipoint session, and to perform a number of other ancillary operations that occur at session join time as well. If the socket, <i>s</i>, is unbound, unique values are assigned to the local association by the system, and the socket is marked as bound.
 * 
 * **WSPJoinLeaf** has the same parameters and semantics as 
 * [LPWSPConnect](nc-ws2spi-lpwspconnect.md) except that it returns a socket descriptor (as in 
 * [LPWSPAccept](nc-ws2spi-lpwspaccept.md)), and it has an additional <i>dwFlags</i> parameter. Only multipoint sockets created using 
 * [LPWSPSocket](nc-ws2spi-lpwspsocket.md) with appropriate multipoint flags set can be used for input parameter <i>s</i> in this function. If the socket is in the nonblocking mode, the returned socket descriptor will not be usable until after a corresponding FD_CONNECT indication on the original socket <i>s</i> has been received, except that 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-closesocket">closesocket</a> can be invoked on this new socket descriptor to cancel a pending join operation. A root node in a multipoint session can call 
 * **WSPJoinLeaf** one or more times in order to add a number of leaf nodes, however at most one multipoint connection request can be outstanding at a time. Refer to 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/protocol-independent-multicast-and-multipoint-in-the-spi-2">Protocol-Independent Multicast and Multipoint in the SPI</a> for additional information.
 * 
 * For nonblocking sockets it is often not possible to complete the connection immediately. In such a case, this function returns an as-yet unusable socket descriptor and the operation proceeds. There is no error code such as <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEWOULDBLOCK</a> in this case, since the function has effectively returned a "successful start" indication. When the final outcome success or failure becomes known, it may be reported through 
 * [LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md) or 
 * [LPWSPEventSelect](nc-ws2spi-lpwspeventselect.md) depending on how the client registers for notification on the original socket <i>s</i>. In either case, the notification is announced with FD_CONNECT and the error code associated with the FD_CONNECT indicates either success or a specific reason for failure. Note that 
 * [LPWSPSelect](nc-ws2spi-lpwspselect.md) cannot be used to detect completion notification for 
 * **WSPJoinLeaf**.
 * 
 * The socket descriptor returned by 
 * **WSPJoinLeaf** is different depending on whether the input socket descriptor, <i>s</i>, is a c_root or a c_leaf. When used with a c_root socket, the <i>name</i> parameter designates a particular leaf node to be added and the returned socket descriptor is a c_leaf socket corresponding to the newly added leaf node. (As is described in section 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/descriptor-allocation-2">Descriptor Allocation</a>, when new socket descriptors are allocated IFS providers must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wpumodifyifshandle">WPUModifyIFSHandle</a> and non-IFS providers must call 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">WPUCreateSocketHandle</a>). The newly created socket has the same properties as <i>s</i> including asynchronous events registered with 
 * [LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md) or with 
 * [LPWSPEventSelect](nc-ws2spi-lpwspeventselect.md). It is not intended to be used for exchange of multipoint data, but rather is used to receive network event indications (for example, FD_CLOSE) for the connection that exists to the particular c_leaf. Some multipoint implementations can also allow this socket to be used for "side chats" between the root and an individual leaf node. An FD_CLOSE indication will be received for this socket if the corresponding leaf node calls 
 * [LPWSPCloseSocket](nc-ws2spi-lpwspclosesocket.md) to drop out of the multipoint session. Symmetrically, invoking 
 * **WSPCloseSocket** on the c_leaf socket returned from 
 * **WSPJoinLeaf** will cause the socket in the corresponding leaf node to get FD_CLOSE notification.
 * 
 * When 
 * **WSPJoinLeaf** is invoked with a c_leaf socket, the <i>name</i> parameter contains the address of the root node (for a rooted control scheme) or an existing multipoint session (nonrooted control scheme), and the returned socket descriptor is the same as the input socket descriptor. In other words, a new socket descriptor is not allocated. In a rooted control scheme, the root application would put its c_root socket in the listening mode by calling 
 * [LPWSPListen](nc-ws2spi-lpwsplisten.md). The standard FD_ACCEPT notification will be delivered when the leaf node requests to join itself to the multipoint session. The root application uses the usual 
 * [LPWSPAccept](nc-ws2spi-lpwspaccept.md) functions to admit the new leaf node. The value returned from 
 * **WSPAccept** is also a c_leaf socket descriptor just like those returned from 
 * **WSPJoinLeaf**. To accommodate multipoint schemes that allow both root-initiated and leaf-initiated joins, it is acceptable for a c_root socket that is already in listening mode to be used as an input to 
 * **WSPJoinLeaf**.
 * 
 * The Windows Sockets SPI client is responsible for allocating any memory space pointed to directly or indirectly by any of the parameters it specifies.
 * 
 * The <i>lpCallerData</i> is a value parameter that contains any user data that is to be sent along with the multipoint session join request. If <i>lpCallerData</i> is **NULL**, no user data will be passed to the peer. The <i>lpCalleeData</i> is a result parameter that will contain any user data passed back from the peer as part of the multipoint session establishment. <i>lpCalleeData</i>-&gt;**len** initially contains the length of the buffer allocated by the Windows Sockets SPI client and pointed to by <i>lpCalleeData</i>-&gt;**buf**. <i>lpCalleeData</i>-&gt;**len** will be set to zero if no user data has been passed back. The <i>lpCalleeData</i> information will be valid when the multipoint join operation is complete. For blocking sockets, this will be when the 
 * **WSPJoinLeaf** function returns. For nonblocking sockets, this will be after the FD_CONNECT notification has occurred on the original socket <i>s</i>. If <i>lpCalleeData</i> is **NULL**, no user data will be passed back. The exact format of the user data is specific to the address family to which the socket belongs and/or the applications involved.
 * 
 * At multipoint session establishment time, a Windows Sockets SPI client can use the <i>lpSQOS</i> parameters to override any previous QoS specification made for the socket through 
 * [LPWSPIoctl](nc-ws2spi-lpwspioctl.md) with the SIO_SET_QOS opcode.
 * 
 * <i>lpSQOS</i> specifies the flow specifications for socket <i>s</i>, one for each direction, followed by any additional provider-specific parameters. If either the associated transport provider in general or the specific type of socket in particular cannot honor the QoS request, an error will be returned as indicated below. The sending or receiving flow specification values will be ignored, respectively, for any unidirectional sockets. If no provider-specific parameters are supplied, the **buf** and **len** members of <i>lpSQOS</i>-&gt;**ProviderSpecific** should be set to **NULL** and zero, respectively. A **NULL** value for <i>lpSQOS</i> indicates no application supplied quality of service.
 * 
 * The <i>dwFlags</i> parameter is used to indicate whether the socket will be acting only as a sender (JL_SENDER_ONLY), only as a receiver (JL_RECEIVER_ONLY), or both (JL_BOTH).
 * 
 * <div class="alert">**Note**  When connected sockets break (that is, become closed for whatever reason), they should be discarded and recreated. It is safest to assume that when things go awry for any reason on a connected socket, the Windows Sockets SPI client must discard and recreate the needed sockets in order to return to a stable point.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspjoinleaf
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPJOINLEAF extends IUnknown {

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
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {SOCKET} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS, dwFlags, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", name, "int", namelen, "ptr", lpCallerData, "ptr", lpCalleeData, "ptr", lpSQOS, "ptr", lpGQOS, "uint", dwFlags, lpErrnoMarshal, lpErrno, "ptr")
        resultHandle := SOCKET({Value: result}, True)
        return resultHandle
    }
}
