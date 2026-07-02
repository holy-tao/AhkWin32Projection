#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by a replacement GINA DLL if Terminal Services is enabled. GINA calls this function to complete the setup of the Terminal Services client.
 * @remarks
 * GINA needs to call this function before starting the shell, so that the migration and setup will be complete before the shell starts, but after it has processed any logon scripts.
 * 
 * In order to use this function, the GINA DLL must specify the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure in its call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a>, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * 
 * Other Winlogon support functions that may be called when Terminal Services is enabled are <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_disconnect">WlxDisconnect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_ic_credentials">WlxQueryInetConnectorCredentials</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_win31_migrate
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_WIN31_MIGRATE {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_WIN31_MIGRATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specify the handle received in the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hWlx) {
        DllCall(this.value, HANDLE, hWlx)
    }

    /**
     * A PWLX_WIN31_MIGRATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_WIN31_MIGRATE {
        /**
         * Creates a PWLX_WIN31_MIGRATE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
