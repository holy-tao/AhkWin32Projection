#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_POST_LOGON_USER_INFO.ahk" { SECPKG_POST_LOGON_USER_INFO }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_AP_POST_LOGON_USER {
    value : IntPtr

    __value {
        set {
            if (value is LSA_AP_POST_LOGON_USER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_POST_LOGON_USER_INFO>} PostLogonUserInfo 
     * @returns {NTSTATUS} 
     */
    Call(PostLogonUserInfo) {
        result := DllCall(this.value, SECPKG_POST_LOGON_USER_INFO.Ptr, PostLogonUserInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A LSA_AP_POST_LOGON_USER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LSA_AP_POST_LOGON_USER {
        /**
         * Creates a LSA_AP_POST_LOGON_USER pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_POST_LOGON_USER_INFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_POST_LOGON_USER_INFO.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
