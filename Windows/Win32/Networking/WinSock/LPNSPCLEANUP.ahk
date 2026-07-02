#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Terminates the use of a particular Windows Sockets namespace service provider.
 * @remarks
 * The **NSPCleanup** function is called when an application is finished using a Windows Sockets namespace service provider. The **NSPCleanup** function deregisters a particular namespace provider and allows the transport service provider to free any of the namespace provider's allocated resources.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-nspstartup">NSPStartup</a> function must be called successfully before using any namespace providers. It is permissible to make more than one 
 * **NSPStartup** call. However, for each 
 * **NSPStartup** call, a corresponding 
 * **NSPCleanup** call must also be issued. Only the final 
 * **NSPCleanup** for the service provider does the actual cleanup; the preceding calls decrement an internal reference count in the service provider.
 * 
 * This function should not return until the namespace service provider DLL can be unloaded from memory.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspcleanup
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPCLEANUP {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPCLEANUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the [GUID](../guiddef/ns-guiddef-guid.md) of the namespace provider to be terminated.
     * @returns {Integer} If no error occurs, then **NSPCleanup** returns a value of **NO_ERROR** (zero). Otherwise, **SOCKET_ERROR** (–1) is returned, and the provider must set the appropriate error code using <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
     * 
     * |Error code|Meaning|
     * |-|-|
     * |<b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_NOT_ENOUGH_MEMORY</a></b>|There is not enough memory available to perform this operation.|
     * |<b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b>|The <i>lpProviderId</i> parameter doesn't specify a valid provider.|
     * |<b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a></b>|The operation is not supported. This error is returned if the namespace provider does not implement this function.|
     */
    Call(lpProviderId) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, Int32)
        return result
    }

    /**
     * A LPNSPCLEANUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPCLEANUP {
        /**
         * Creates a LPNSPCLEANUP pointer that invokes the given AHK function when called.
         * @param {Func(Guid) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
