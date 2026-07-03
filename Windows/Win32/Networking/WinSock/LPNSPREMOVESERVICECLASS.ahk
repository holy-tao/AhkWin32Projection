#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * Permanently removes a specified service class from the namespace.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspremoveserviceclass
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPREMOVESERVICECLASS {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPREMOVESERVICECLASS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the GUID of the specific namespace provider that this service class schema is to be removed from.
     * @param {Pointer<Guid>} lpServiceClassId A pointer to the GUID for the service class to remove.
     * @returns {Integer} The function should return **NO_ERROR** (zero) if the routine succeeds. It should return **SOCKET_ERROR** (–1) if the routine fails and it must set the appropriate error code using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_INVALID_PARAMETER</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified GUID was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling routine does not have sufficient privileges to remove the Service.
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
     * The specified service class identifier GUID was not valid.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSATYPE_NOT_FOUND</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class was not found in any of the namespaces.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(lpProviderId, lpServiceClassId) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, Guid.Ptr, lpServiceClassId, Int32)
        return result
    }

    /**
     * A LPNSPREMOVESERVICECLASS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPREMOVESERVICECLASS {
        /**
         * Creates a LPNSPREMOVESERVICECLASS pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
