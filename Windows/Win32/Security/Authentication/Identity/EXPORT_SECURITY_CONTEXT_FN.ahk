#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct EXPORT_SECURITY_CONTEXT_FN {
    value : IntPtr

    __value {
        set {
            if (value is EXPORT_SECURITY_CONTEXT_FN) {
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
     * @param {Integer} param1 
     * @param {Pointer<SecBuffer>} param2 
     * @param {Pointer<Pointer<Void>>} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, UInt32, param1, SecBuffer.Ptr, param2, param3Marshal, param3, "HRESULT")
        return result
    }

    /**
     * A EXPORT_SECURITY_CONTEXT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXPORT_SECURITY_CONTEXT_FN {
        /**
         * Creates a EXPORT_SECURITY_CONTEXT_FN pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, UInt32, SecBuffer, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, UInt32, SecBuffer.Ptr, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
