#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct QUERY_SECURITY_CONTEXT_TOKEN_FN {
    value : IntPtr

    __value {
        set {
            if (value is QUERY_SECURITY_CONTEXT_TOKEN_FN) {
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
     * @param {Pointer<Pointer<Void>>} param1 
     * @returns {HRESULT} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A QUERY_SECURITY_CONTEXT_TOKEN_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERY_SECURITY_CONTEXT_TOKEN_FN {
        /**
         * Creates a QUERY_SECURITY_CONTEXT_TOKEN_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
