#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WLX_MPR_NOTIFY_INFO.ahk" { WLX_MPR_NOTIFY_INFO }

/**
 * Called by GINA to indicate it has changed a password.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_change_password_notify
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_CHANGE_PASSWORD_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_CHANGE_PASSWORD_NOTIFY) {
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
     * @param {Pointer<WLX_MPR_NOTIFY_INFO>} pMprInfo Points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_mpr_notify_info">WLX_MPR_NOTIFY_INFO</a> structure that contains <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">Multiple Provider Router</a> (MPR) information. Winlogon will call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to free all the data pointed to by this structure when it is done with it.
     * @param {Integer} dwChangeInfo Changes the information flags from 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/network-provider-api">Network Provider API</a>.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify_ex">WlxChangePasswordNotifyEx</a> function returns zero if the function call succeeds. Any other value indicates an error.
     */
    Call(hWlx, pMprInfo, dwChangeInfo) {
        result := DllCall(this.value, HANDLE, hWlx, WLX_MPR_NOTIFY_INFO.Ptr, pMprInfo, UInt32, dwChangeInfo, Int32)
        return result
    }

    /**
     * A PWLX_CHANGE_PASSWORD_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_CHANGE_PASSWORD_NOTIFY {
        /**
         * Creates a PWLX_CHANGE_PASSWORD_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, WLX_MPR_NOTIFY_INFO, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, WLX_MPR_NOTIFY_INFO.Ptr, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
