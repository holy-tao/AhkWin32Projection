#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * The LPWSPGetSockName function gets the local name for a socket.
 * @remarks
 * **LPWSPGetSockName** retrieves the current name for the specified socket descriptor in <i>name</i>. It is used on a bound and/or connected socket specified by the <i>s</i> parameter. The local association is returned. This call is especially useful when a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> call has been made without doing a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> first; as this call provides the only means by which the local association that has been set by the service provider can be determined.
 * 
 * If a socket was bound to an unspecified address (for example, ADDR_ANY), indicating that any of the host's addresses within the specified address family should be used for the socket, **LPWSPGetSockName** will <i>not</i> necessarily return information about the host address, unless the socket has been connected with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> or **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)**. The Windows Sockets SPI client must not assume that an address will be specified unless the socket is connected. This is because for a multihomed host, the address that will be used for the socket is unknown until the socket is connected.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockname
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPGETSOCKNAME {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPGETSOCKNAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Descriptor identifying a bound socket.
     * @param {Integer} name Pointer to a <b><a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">sockaddr</a></b> structure used to supply the address (name) of the socket.
     * @param {Pointer<Integer>} namelen On input, pointer to an integer that indicates the size of the structure pointed to by <i>name</i>, in bytes. On output indicates the size of the returned name, in bytes.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPGetSockName** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETDOWN">WSAENETDOWN</a></b></dl>
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> or the <i>namelen</i> parameter is not a valid part of the user address space, or the <i>namelen</i> parameter is too small.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINPROGRESS">WSAEINPROGRESS</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Function is invoked when a callback is in progress.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The descriptor is not a socket.  
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINVAL">WSAEINVAL</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Socket has not been bound to an address with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b>, or ADDR_ANY is specified in **LPWSPBind** but connection has not yet occurred.  
     * </td>
     * </tr>
     * </table>
     */
    Call(s, name, namelen, lpErrno) {
        namelenMarshal := namelen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, IntPtr, name, namelenMarshal, namelen, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPGETSOCKNAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPGETSOCKNAME {
        /**
         * Creates a LPWSPGETSOCKNAME pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, IntPtr, "int*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, IntPtr, "int*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
