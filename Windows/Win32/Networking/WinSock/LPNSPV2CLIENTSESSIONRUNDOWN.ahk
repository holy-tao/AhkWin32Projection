#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Notifies a namespace service provider version-2 (NSPv2) provider that the client session is terminating.
 * @remarks
 * The 
 * **NSPv2ClientSessionRundown** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2ClientSessionRundown** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. If a value was specified for the client session argument in the call to the **NSPv2Startup** function, then this same client session argument is passed in the  <i>pvClientSessionArg</i> parameter to the **NSPv2ClientSessionRundown** function.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a>,  **NSPv2ClientSessionRundown**, and  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions are optional, dependent on the requirements of the NSPv2 provider.
 * 
 *  If the **NSPv2ClientSessionRundown** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2ClientSessionRundown** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPV2CLIENTSESSIONRUNDOWN {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPV2CLIENTSESSIONRUNDOWN) {
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
     * @param {Pointer<Void>} pvClientSessionArg A pointer to the client session that is terminating.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpProviderId, pvClientSessionArg) {
        pvClientSessionArgMarshal := pvClientSessionArg is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Guid.Ptr, lpProviderId, pvClientSessionArgMarshal, pvClientSessionArg)
    }

    /**
     * A LPNSPV2CLIENTSESSIONRUNDOWN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPV2CLIENTSESSIONRUNDOWN {
        /**
         * Creates a LPNSPV2CLIENTSESSIONRUNDOWN pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
