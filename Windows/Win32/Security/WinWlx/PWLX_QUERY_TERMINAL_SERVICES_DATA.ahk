#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLX_TERMINAL_SERVICES_DATA.ahk" { WLX_TERMINAL_SERVICES_DATA }

/**
 * Called by GINA to retrieve Terminal Services user configuration information after a user has logged on.
 * @remarks
 * <b>WlxQueryTerminalServicesData</b> should be called from within GINA's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedoutsas">WlxLoggedOutSAS</a> after a user has been authenticated.
 * 
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_query_terminal_services_data
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_QUERY_TERMINAL_SERVICES_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_QUERY_TERMINAL_SERVICES_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the Winlogon handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {Pointer<WLX_TERMINAL_SERVICES_DATA>} pTSData Points to a structure that will contain the user configuration information specific to Terminal Services.
     * @param {PWSTR} UserName Pointer to a null-terminated wide character string that specifies the name of the newly logged-on user.
     * @param {PWSTR} Domain Pointer to a null-terminated wide character string that specifies the newly logged-on user's domain.
     * @returns {Integer} The <b>WlxQueryTerminalServicesData</b> function returns zero if the user-configuration information was retrieved successfully. Otherwise, it returns an error code.
     */
    Call(hWlx, pTSData, UserName, Domain) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        Domain := Domain is String ? StrPtr(Domain) : Domain

        result := DllCall(this.value, HANDLE, hWlx, WLX_TERMINAL_SERVICES_DATA.Ptr, pTSData, "ptr", UserName, "ptr", Domain, UInt32)
        return result
    }

    /**
     * A PWLX_QUERY_TERMINAL_SERVICES_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_QUERY_TERMINAL_SERVICES_DATA {
        /**
         * Creates a PWLX_QUERY_TERMINAL_SERVICES_DATA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, WLX_TERMINAL_SERVICES_DATA, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, WLX_TERMINAL_SERVICES_DATA.Ptr, PWSTR, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
