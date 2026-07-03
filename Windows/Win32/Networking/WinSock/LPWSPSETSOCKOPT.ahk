#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * The LPWSPSetSockOpt function sets a socket option.
 * @remarks
 * The **LPWSPSetSockOpt** function sets the current value for a socket option associated with a socket of any type, in any state. Although options can exist at multiple protocol levels, they are always present at the uppermost socket level. Options affect socket operations, such as whether broadcast messages can be sent on the socket.
 * 
 * There are two types of socket options: Boolean options that enable or disable a feature or behavior, and options that require an integer value or structure. To enable a Boolean option, <i>optval</i> points to a nonzero integer. To disable the option, <i>optval</i> points to an integer equal to zero. The <i>optlen</i> parameter should be equal to sizeof (int) for Boolean options. For other options, <i>optval</i> points to an integer or structure that contains the desired value for the option, and <i>optlen</i> is the length of the integer or structure.
 * 
 * For more information about socket options, see <b><a href="https://docs.microsoft.com/windows/win32/winsock/socket-options">Socket Options</a></b>.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSETSOCKOPT {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSETSOCKOPT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s The descriptor that identifies a socket.
     * @param {Integer} level The level at which the option is defined; the supported levels include <b><a href="https://docs.microsoft.com/windows/win32/winsock/sol-socket-socket-options">SOL_SOCKET</a></b>. For more information, see [Winsock Annexes](/windows/win32/winsock/winsock-annexes).
     * @param {Integer} optname The socket option for which the value is to be set.
     * @param {Integer} optval A pointer to the buffer in which the value for the requested option is supplied.
     * @param {Integer} optlen The size, in bytes, of the <i>optval</i> buffer.
     * @param {Pointer<Integer>} lpErrno A pointer to the error code.
     * @returns {Integer} If no error occurs, **LPWSPSetSockOpt** returns zero. Otherwise, a value of **SOCKET_ERROR** is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * The <i>optval</i> is not in a valid part of the process address space or <i>optlen</i> parameter is too small.
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
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINVAL">WSAEINVAL</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>level</i> is not valid, or the information in <i>optval</i> is not valid.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETRESET">WSAENETRESET</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOPROTOOPT">WSAENOPROTOOPT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Option is unknown or unsupported for the specified provider.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTCONN">WSAENOTCONN</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has been reset when <a href="https://docs.microsoft.com/windows/win32/winsock/so-keepalive">SO_KEEPALIVE</a> is set.
     * </td>
     * </tr>
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
     * </table>
     */
    Call(s, level, optname, optval, optlen, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, Int32, level, Int32, optname, IntPtr, optval, Int32, optlen, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPSETSOCKOPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSETSOCKOPT {
        /**
         * Creates a LPWSPSETSOCKOPT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, Int32, Int32, IntPtr, Int32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, Int32, Int32, IntPtr, Int32, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
