#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct IMPERSONATE_SECURITY_CONTEXT_FN {
    value : IntPtr

    __value {
        set {
            if (value is IMPERSONATE_SECURITY_CONTEXT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SecHandle>} param0 
     * @returns {HRESULT} 
     */
    Call(param0) {
        result := DllCall(this.value, SecHandle.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * A IMPERSONATE_SECURITY_CONTEXT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IMPERSONATE_SECURITY_CONTEXT_FN {
        /**
         * Creates a IMPERSONATE_SECURITY_CONTEXT_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
