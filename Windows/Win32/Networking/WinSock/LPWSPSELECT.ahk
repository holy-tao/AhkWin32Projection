#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FD_SET.ahk" { FD_SET }
#Import ".\TIMEVAL.ahk" { TIMEVAL }

/**
 * The LPWSPSelect function determines the status of one or more sockets.
 * @remarks
 * This function is used to determine the status of one or more sockets. For each socket, the caller can request information on read, write, or error status. The set of sockets for which a given status is requested is indicated by an <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set">fd_set</a> structure. All entries in an **fd_set** correspond to sockets created by the service provider (that is, the <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa?redirectedfrom=MSDN">WSAPROTOCOL_INFO</a></b> structures describing their protocols have the same *providerId* value). Upon return, the structures are updated to reflect the subset of these sockets that meet the specified condition, and **LPWSPSelect** returns the total number of sockets meeting the conditions. A set of macros is provided for manipulating an **fd_set**. These macros are compatible with those used in the Berkeley software, but the underlying representation is completely different.
 * 
 * The parameter <i>readfds</i> identifies those sockets that are to be checked for readability. If the socket is currently listening through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">LPWSPListen</a></b>, it will be marked as readable if an incoming connection request has been received, so that a [LPWSPAccept](nc-ws2spi-lpwspaccept.md) is guaranteed to complete without blocking. For other sockets, readability means that queued data is available for reading so that a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> or [LPWSPRecvFrom](./nc-ws2spi-lpwsprecvfrom.md) is guaranteed not to block.
 * 
 * For connection-oriented sockets, readability can also indicate that a close request has been received from the peer. If the virtual circuit was closed gracefully, then a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> will return immediately with zero bytes read. If the virtual circuit was reset, then a **LPWSPRecv** will complete immediately with an error code, such as WSAECONNRESET. The presence of OOB data will be checked if the socket option SO_OOBINLINE has been enabled (see <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b>).
 * 
 * The parameter <i>writefds</i> identifies those sockets that are to be checked for writability:
 * 
 * -   If a socket is connecting through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b>, writability means that the connection establishment successfully completed.
 * -   If the socket is not in the process of listening through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b>, writability means that a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b> or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> are guaranteed to succeed.
 * 
 * However, they can block on a blocking socket if the **len** exceeds the amount of outgoing system buffer space available. It is not specified how long these guarantees can be assumed to be valid, particularly in a multithreaded environment.
 * 
 * The parameter <i>exceptfds</i> identifies those sockets that are to be checked for the presence of OOB data or any exceptional error conditions. Note that OOB data will only be reported in this way if the option SO_OOBINLINE is **FALSE**. If a socket is making a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> (nonblocking) connection, failure of the connect attempt is indicated in <i>exceptfds</i>. This specification does not define which other errors will be included.
 * 
 * Any two of <i>readfds</i>, <i>writefds</i>, or <i>exceptfds</i> can be given as **null** if no descriptors are to be checked for the condition of interest. At least one must be non-**null**, and any non-**null** descriptor set must contain at least one socket descriptor.
 * 
 * Summary: A socket will be identified in a particular set when **LPWSPSelect** returns according to the following.
 * 
 * 
 * | Parameter | Description |
 * |---|---|
 * | <i>readfds</i>: | If <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">LPWSPListen</a></b> is called, a connection is pending, **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)** will succeed.Data is available for reading (includes OOB data if SO_OOBINLINE is enabled).The connection has been closed/reset/terminated. |
 * | <i>writefds</i>:  | If <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> (nonblocking), connection has succeeded.Data can be sent.|
 * | <i>exceptfds</i>: | If <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> (nonblocking), connection attempt failed.OOB data is available for reading (only if SO_OOBINLINE is disabled). |
 * 
 * 
 * 
 *  
 * 
 *  
 * 
 * Three macros and one upcall function are defined in the header file Ws2spi.h for manipulating and checking the descriptor sets. The variable FD_SETSIZE determines the maximum number of descriptors in a set. (The default value of FD_SETSIZE is 64, which can be modified by \#defining FD_SETSIZE to another value before \#including Ws2spi.h.) Internally, socket handles in a <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set">fd_set</a> are not represented as bit flags as in Berkeley UNIX. Their data representation is opaque. Use of these macros will maintain software portability between different socket environments.
 * 
 * The macros to manipulate and check <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set">fd_set</a> contents are:
 * 
 * <dl> <dt>
 * 
 * <span id="FD_CLR_s___set_"></span><span id="fd_clr_s___set_"></span><span id="FD_CLR_S___SET_"></span>**FD_CLR(<i>s</i>, \**set*)**
 * </dt> <dd>
 * 
 * Removes the descriptor <i>s</i> from *set*.
 * 
 * </dd> <dt>
 * 
 * <span id="FD_SET_s___set_"></span><span id="fd_set_s___set_"></span><span id="FD_SET_S___SET_"></span>**FD_SET(<i>s</i>, \**set*)**
 * </dt> <dd>
 * 
 * Adds descriptor <i>s</i> to *set*.
 * 
 * </dd> <dt>
 * 
 * <span id="FD_ZERO__set_"></span><span id="fd_zero__set_"></span><span id="FD_ZERO__SET_"></span>**FD_ZERO(\**set*)**
 * </dt> <dd>
 * 
 * Initializes the *set* to the **null** set.
 * 
 * </dd> </dl>
 * 
 * The upcall function used to check the membership is:
 * 
 * <dl> <dt>
 * 
 * <span id="intWPUFDIsSet__SOCKETs__FD_SET_FAR__set__"></span><span id="intwpufdisset__sockets__fd_set_far__set__"></span><span id="INTWPUFDISSET__SOCKETS__FD_SET_FAR__SET__"></span>**intWPUFDIsSet** (**SOCKET**<i>s</i>, **FD_SET FAR** \**set*);
 * </dt> <dd>
 * 
 * which will return nonzero if <i>s</i> is a member of the *set* or otherwise zero.
 * 
 * </dd> </dl>
 * 
 * The parameter <i>timeout</i> controls how long the **LPWSPSelect** can take to complete. If <i>timeout</i> is a **null** pointer, **LPWSPSelect** will block indefinitely until at least one descriptor meets the specified criteria. Otherwise, <i>timeout</i> points to a [**timeval**](../winsock2/ns-winsock2-timeval.md) structure that specifies the maximum time that **LPWSPSelect** should wait before returning. When **LPWSPSelect** returns, the contents of the **timeval** structure are not altered. If **timeval** is initialized to {0, 0}, **LPWSPSelect** will return immediately; this is used to poll the state of the selected sockets. If this is the case, then the **LPWSPSelect** call is considered nonblocking and the standard assumptions for nonblocking calls apply. For example, the blocking hook will not be called, and the Windows Sockets provider will not yield.
 * 
 * > [!Note]  
 * > The **LPWSPSelect** function has no effect on the persistence of socket events registered with **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspeventselect">LPWSPEventSelect</a></b>.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspselect
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSELECT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSELECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} nfds Ignored and included only for the sake of compatibility.
     * @param {Pointer<FD_SET>} readfds Optional pointer to a set of sockets to be checked for readability.
     * @param {Pointer<FD_SET>} writefds Optional pointer to a set of sockets to be checked for writability.
     * @param {Pointer<FD_SET>} exceptfds Optional pointer to a set of sockets to be checked for errors.
     * @param {Pointer<TIMEVAL>} timeout Maximum time for **LPWSPSelect** to wait, or **null** for a blocking operation, in the form of a [**timeval**](../winsock2/ns-winsock2-timeval.md) structure.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} The **LPWSPSelect** function returns the total number of descriptors that are ready and contained in the <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-fd_set">fd_set</a> structures, or SOCKET_ERROR if an error occurred. If the return value is SOCKET_ERROR, a specific error code is available in <i>lpErrno</i>.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Meaning</th>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Sockets service provider was unable to allocated needed resources for its internal operations, or the <i>readfds</i>, <i>writefds</i>, <i>exceptfds</i> or <i>timeval</i> parameters are not part of the user address space. 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETDOWN">WSAENETDOWN</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed. 
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINVAL">WSAEINVAL</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>timeout</i> value is not valid, or all three descriptor parameters were <b>NULL</b>.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINTR">WSAEINTR</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (Blocking) call was canceled through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspcancelblockingcall">LPWSPCancelBlockingCall</a></b>.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINPROGRESS">WSAEINPROGRESS</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocking Windows Sockets call is in progress, or the service provider is still processing a callback function.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the descriptor sets contains an entry that is not a socket.
     * </td>
     * </tr>
     * </table>
     */
    Call(nfds, readfds, writefds, exceptfds, timeout, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Int32, nfds, FD_SET.Ptr, readfds, FD_SET.Ptr, writefds, FD_SET.Ptr, exceptfds, TIMEVAL.Ptr, timeout, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPSELECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSELECT {
        /**
         * Creates a LPWSPSELECT pointer that invokes the given AHK function when called.
         * @param {Func(Int32, FD_SET, FD_SET, FD_SET, TIMEVAL, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, FD_SET.Ptr, FD_SET.Ptr, FD_SET.Ptr, TIMEVAL.Ptr, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
