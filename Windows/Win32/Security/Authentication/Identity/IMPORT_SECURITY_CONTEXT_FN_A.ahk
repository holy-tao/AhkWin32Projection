#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct IMPORT_SECURITY_CONTEXT_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is IMPORT_SECURITY_CONTEXT_FN_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<SecBuffer>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<SecHandle>} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param0Marshal := param0 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, SecBuffer.Ptr, param1, param2Marshal, param2, SecHandle.Ptr, param3, "HRESULT")
        return result
    }

    /**
     * A IMPORT_SECURITY_CONTEXT_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IMPORT_SECURITY_CONTEXT_FN_A {
        /**
         * Creates a IMPORT_SECURITY_CONTEXT_FN_A pointer that invokes the given AHK function when called.
         * @param {Func("char*", SecBuffer, "ptr", SecHandle) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", SecBuffer.Ptr, "ptr", SecHandle.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
