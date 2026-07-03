#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WSASERVICECLASSINFOW.ahk" { WSASERVICECLASSINFOW }

/**
 * The NSPInstallServiceClass function registers service class schema within the namespace providers.
 * @remarks
 * Namespace providers are encouraged, but not required, to store information that is specific to the namespace they support.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspinstallserviceclass
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPINSTALLSERVICECLASS {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPINSTALLSERVICECLASS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the GUID of the specific namespace provider that this service class schema is registered in.
     * @param {Pointer<WSASERVICECLASSINFOW>} lpServiceClassInfo A pointer to the service class schema information.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_INVALID_PARAMETER</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The namespace provider cannot supply the requested class information.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling routine does not have sufficient privileges to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEALREADY</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The service class information has already been registered for this service class identifier. To modify service class information, first call <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspremoveserviceclass">NSPRemoveServiceClass</a>, then reinstall with updated class information data.
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
     * The service class identifier was invalid or improperly structured. This error is returned if the <i>lpServiceClassInfo</i> parameter is **NULL**.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANO_DATA</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested name is valid, but no data of the requested type was found.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(lpProviderId, lpServiceClassInfo) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, WSASERVICECLASSINFOW.Ptr, lpServiceClassInfo, Int32)
        return result
    }

    /**
     * A LPNSPINSTALLSERVICECLASS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPINSTALLSERVICECLASS {
        /**
         * Creates a LPNSPINSTALLSERVICECLASS pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WSASERVICECLASSINFOW) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WSASERVICECLASSINFOW.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
