#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called to free the handle after previous calls to NSPv2LookupServiceBegin and NSPv2LookupServiceNextEx.
 * @remarks
 * The 
 * **NSPv2LookupServiceEnd** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2LookupServiceEnd** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * It is possible to receive an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function call on another thread while processing an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a>. This indicates that the client has canceled the request and the provider should close the handle and return from the 
 * **NSPv2LookupServiceNextEx** function call as well, setting the last error to **WSA_E_CANCELLED**.
 * 
 * In Windows Sockets 2, conflicting error codes are defined for **WSAECANCELLED** and <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_E_CANCELLED</a>. The error code **WSAECANCELLED** will be removed in a future version and only WSA_E_CANCELLED will remain. Namespace Providers should use the WSA_E_CANCELLED error code to maintain compatibility with the widest possible range of applications.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspv2lookupserviceend
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPV2LOOKUPSERVICEEND {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPV2LOOKUPSERVICEEND) {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a>.
     * @returns {Integer} The function should return **NO_ERROR** (zero) if the routine succeeds. It should return **SOCKET_ERROR** (that is, 1) if the routine fails and it must set the appropriate error code using <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
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
     * </table>
     */
    Call(hLookup) {
        result := DllCall(this.value, HANDLE, hLookup, Int32)
        return result
    }

    /**
     * A LPNSPV2LOOKUPSERVICEEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPV2LOOKUPSERVICEEND {
        /**
         * Creates a LPNSPV2LOOKUPSERVICEEND pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
