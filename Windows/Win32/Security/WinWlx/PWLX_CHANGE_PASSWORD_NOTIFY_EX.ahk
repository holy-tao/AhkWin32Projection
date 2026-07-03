#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLX_MPR_NOTIFY_INFO.ahk" { WLX_MPR_NOTIFY_INFO }

/**
 * Called by GINA to tell a specific network provider (or all network providers) that a password has changed.
 * @remarks
 * This function supersedes the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify">WlxChangePasswordNotify</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_change_password_notify_ex
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_CHANGE_PASSWORD_NOTIFY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_CHANGE_PASSWORD_NOTIFY_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a> handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {Pointer<WLX_MPR_NOTIFY_INFO>} pMprInfo Points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_mpr_notify_info">WLX_MPR_NOTIFY_INFO</a> structure that contains <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">Multiple Provider Router</a> (MPR) information. Winlogon will call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to free all the data pointed to by this structure when it is done with it.
     * @param {Integer} dwChangeInfo Changes the information flags from Network Provider API.
     * @param {PWSTR} ProviderName Specifies the name of a network provider, or <b>NULL</b> to allow the system to notify all network providers.
     * @param {Pointer<Void>} Reserved Reserved. Must be set to zero.
     * @returns {Integer} The <b>WlxChangePasswordNotifyEx</b> function returns zero if the function call succeeds. Any other value indicates an error.
     */
    Call(hWlx, pMprInfo, dwChangeInfo, ProviderName, Reserved) {
        ProviderName := ProviderName is String ? StrPtr(ProviderName) : ProviderName

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, hWlx, WLX_MPR_NOTIFY_INFO.Ptr, pMprInfo, UInt32, dwChangeInfo, "ptr", ProviderName, ReservedMarshal, Reserved, Int32)
        return result
    }

    /**
     * A PWLX_CHANGE_PASSWORD_NOTIFY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_CHANGE_PASSWORD_NOTIFY_EX {
        /**
         * Creates a PWLX_CHANGE_PASSWORD_NOTIFY_EX pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, WLX_MPR_NOTIFY_INFO, UInt32, PWSTR, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, WLX_MPR_NOTIFY_INFO.Ptr, UInt32, PWSTR, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
