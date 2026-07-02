#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} RedirectedLogonHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(RedirectedLogonHandle) {
        DllCall(this.value, HANDLE, RedirectedLogonHandle)
    }

    /**
     * A PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK {
        /**
         * Creates a PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK pointer that invokes the given AHK function when called.
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
