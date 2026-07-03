#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called to free the handle after previous calls to NSPLookupServiceBegin and NSPLookupServiceNext.
 * @remarks
 * In Windows Sockets 2, conflicting error codes are defined for **WSAECANCELLED** and <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_E_CANCELLED</a>. The error code **WSAECANCELLED** will be removed in a future version and only WSA_E_CANCELLED will remain. Namespace Providers should use the WSA_E_CANCELLED error code to maintain compatibility with the widest possible range of applications.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnsplookupserviceend
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPLOOKUPSERVICEEND {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPLOOKUPSERVICEEND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hLookup The handle obtained previously by a call to  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a>.
     * @returns {Integer} The function should return **NO_ERROR** (zero) if the routine succeeds. It should return **SOCKET_ERROR** (–1) if the routine fails and it must set the appropriate error code using <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_INVALID_HANDLE</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_NOT_ENOUGH_MEMORY</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not supported. This error is returned if the namespace provider does not implement this function. 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hLookup) {
        result := DllCall(this.value, HANDLE, hLookup, Int32)
        return result
    }

    /**
     * A LPNSPLOOKUPSERVICEEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPLOOKUPSERVICEEND {
        /**
         * Creates a LPNSPLOOKUPSERVICEEND pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
