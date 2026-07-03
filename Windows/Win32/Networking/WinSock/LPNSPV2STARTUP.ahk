#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Notifies a namespace service provider version-2 (NSPv2) provider that a new client process is to begin using the provider.
 * @remarks
 * The 
 * **NSPv2Startup** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2Startup** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * **NSPv2Startup** function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. The value in the <i>ppvClientSessionArg</i> parameter will be passed to subsequent NSPv2 function calls in the same session. The client session argument may **NULL**, if the namespace provider does not require this information. 
 * 
 * The **NSPv2Startup** function is called when a new client session initializes. 
 * The **NSPv2Startup** and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions must be called as pairs. 
 * 
 * The 
 * **NSPv2Startup** function must be called successfully before calling the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> function. It is permissible to make more than one 
 * **NSPv2Startup** call. However, for each 
 * **NSPv2Startup** call, a corresponding 
 * **NSPv2Cleanup** call must also be issued. Only the final 
 * **NSPv2Cleanup** for the service provider does the actual cleanup; the preceding calls decrement an internal reference count in the namespace service provider.
 * 
 * The **NSPv2Startup**,  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown">NSPv2ClientSessionRundown</a>, and  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions are optional, dependent on the requirements of the NSPv2 provider.
 * 
 *  If the **NSPv2Startup** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2Startup** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspv2startup
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPV2STARTUP {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPV2STARTUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the GUID of the specific namespace provider to notify.
     * @param {Pointer<Pointer<Void>>} ppvClientSessionArg A pointer to the client session.
     * @returns {Integer} The function should return **NO_ERROR** (zero) if the routine succeeds. It should return **SOCKET_ERROR** (that is, 1) if the routine fails and it must set the appropriate error code using 
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling routine does not have sufficient privileges to initialize the service.
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
     * One or more parameters were invalid, or missing, for this provider.
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
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSASERVICE_NOT_FOUND</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Service is unknown. The service cannot be found in the specified namespace.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(lpProviderId, ppvClientSessionArg) {
        ppvClientSessionArgMarshal := ppvClientSessionArg is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, ppvClientSessionArgMarshal, ppvClientSessionArg, Int32)
        return result
    }

    /**
     * A LPNSPV2STARTUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPV2STARTUP {
        /**
         * Creates a LPNSPV2STARTUP pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "ptr*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
