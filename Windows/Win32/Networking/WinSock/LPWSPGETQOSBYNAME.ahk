#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\QOS.ahk" { QOS }
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * The LPWSPGetQOSByName function initializes a QOS structure based on a named template, or retrieves an enumeration of the available template names.
 * @remarks
 * Clients can use <i>WSPGetQOSByName</i> to initialize a <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/qos-structures">QOS</a></b> structure to a set of known values appropriate for a particular service class or media type. These values are stored in a template that is referenced by a well-known name. The client may retrieve these values by setting the **buf** member of the **WSABUF** indicated by <i>lpQOSName</i> to point to a Unicode string of nonzero length specifying a template name. In this case the usage of <i>lpQOSName</i> is IN only, and results are returned through <i>lpQOS</i>.
 * 
 * Alternatively, the client may use **LPWSPGetQOSByName** to retrieve an enumeration of available template names. The client may do this by setting the **buf** member of the **WSABUF** indicated by <i>lpQOSName</i> to a zero-length null-terminated Unicode string. In this case, the buffer indicated by **buf** is overwritten with a sequence of as many null-terminated Unicode template name strings as are available up to the number of bytes available in **buf** as indicated by the **len** member of the **WSABUF** indicated by <i>lpQOSName</i>. The list of names itself is terminated by a zero-length Unicode name string. When **LPWSPGetQOSByName** is used to retrieve template names, the <i>lpQOS</i> parameter is ignored.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetqosbyname
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPGETQOSBYNAME {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPGETQOSBYNAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Descriptor identifying a socket.
     * @param {Pointer<WSABUF>} lpQOSName Specifies the QOS template name, or supplies a buffer to retrieve an enumeration of the available template names.
     * @param {Pointer<QOS>} lpQOS Pointer to the <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/qos-structures">QOS</a></b> structure to be filled.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {BOOL} If the function succeeds, the return value is **TRUE**. If the function fails, the return value is **FALSE**, and a specific error code is available in <i>lpErrno</i>.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAENOTSOCK</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpQOS</i> argument is not a valid part of the user address space, or the buffer length for <i>lpQOS</i> is too small.
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
     * The specified QOS template name is invalid.
     * </td>
     * </tr>
     * </table>
     */
    Call(s, lpQOSName, lpQOS, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, WSABUF.Ptr, lpQOSName, QOS.Ptr, lpQOS, lpErrnoMarshal, lpErrno, BOOL)
        return result
    }

    /**
     * A LPWSPGETQOSBYNAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPGETQOSBYNAME {
        /**
         * Creates a LPWSPGETQOSBYNAME pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, WSABUF, QOS, "int*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, WSABUF.Ptr, QOS.Ptr, "int*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
