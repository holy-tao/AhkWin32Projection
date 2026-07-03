#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * The LPWSPGetSockOpt function retrieves a socket option.
 * @remarks
 * The **LPWSPGetSockOpt** function retrieves the current value for a socket option associated with a socket of any type, in any state, and stores the result in <i>optval</i>. Options can exist at multiple protocol levels, but they are always present at the uppermost socket' level. Options affect socket operations, such as the routing of packets and OOB data transfer.
 * 
 * The value associated with the selected option is returned in the buffer <i>optval</i>. The integer pointed to by <i>optlen</i> should originally contain the size of this buffer; on return, it will be set to the size of the value returned. For SO_LINGER, this will be the size of a structure linger; for most other options it will be the size of an integer.
 * 
 * The Windows Sockets SPI client is responsible for allocating any memory space pointed to directly or indirectly by any of the parameters it specifies.
 * 
 * If the option was never set with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b>, then **LPWSPGetSockOpt** returns the default value for the option.
 * 
 * For more information on socket options, see <b><a href="https://docs.microsoft.com/windows/win32/winsock/socket-options">Socket Options</a></b>.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockopt
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPGETSOCKOPT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPGETSOCKOPT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s A descriptor identifying a socket.
     * @param {Integer} level The level at which the option is defined; the supported levels include <b><a href="https://docs.microsoft.com/windows/win32/winsock/sol-socket-socket-options">SOL_SOCKET</a></b>. (See annex for more protocol-specific levels.)
     * @param {Integer} optname The socket option for which the value is to be retrieved.
     * @param {Integer} optval A pointer to the buffer in which the value for the requested option is to be returned.
     * @param {Pointer<Integer>} optlen A pointer to the size, in bytes, of the <i>optval</i> buffer.
     * @param {Pointer<Integer>} lpErrno A pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPGetSockOpt** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the <i>optval</i> or the <i>optlen</i> parameters is not a valid part of the user address space, or the <i>optlen</i> parameter is too small.  
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
     * The <i>level</i> is unknown or invalid.
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
     * Function is invoked when a callback is in progress.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOPROTOOPT">WSAENOPROTOOPT</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Option is unknown or unsupported by the indicated protocol family.
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
     * The descriptor is not a socket.
     * </td>
     * </tr>
     * </table>
     */
    Call(s, level, optname, optval, optlen, lpErrno) {
        optlenMarshal := optlen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, Int32, level, Int32, optname, IntPtr, optval, optlenMarshal, optlen, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPGETSOCKOPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPGETSOCKOPT {
        /**
         * Creates a LPWSPGETSOCKOPT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, Int32, Int32, IntPtr, "int*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, Int32, Int32, IntPtr, "int*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
