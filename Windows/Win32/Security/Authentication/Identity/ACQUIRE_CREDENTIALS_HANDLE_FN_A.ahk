#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SEC_GET_KEY_FN.ahk" { SEC_GET_KEY_FN }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct ACQUIRE_CREDENTIALS_HANDLE_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is ACQUIRE_CREDENTIALS_HANDLE_FN_A) {
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
     * @param {Pointer<Integer>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Pointer<Void>} param4 
     * @param {Pointer<SEC_GET_KEY_FN>} param5 
     * @param {Pointer<Void>} param6 
     * @param {Pointer<SecHandle>} param7 
     * @param {Pointer<Integer>} param8 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        param0Marshal := param0 is VarRef ? "char*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"
        param8Marshal := param8 is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, UInt32, param2, param3Marshal, param3, param4Marshal, param4, SEC_GET_KEY_FN, param5, param6Marshal, param6, SecHandle.Ptr, param7, param8Marshal, param8, "HRESULT")
        return result
    }

    /**
     * A ACQUIRE_CREDENTIALS_HANDLE_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACQUIRE_CREDENTIALS_HANDLE_FN_A {
        /**
         * Creates a ACQUIRE_CREDENTIALS_HANDLE_FN_A pointer that invokes the given AHK function when called.
         * @param {Func("char*", "char*", UInt32, "ptr", "ptr", SEC_GET_KEY_FN, "ptr", SecHandle, "int64*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", "char*", UInt32, "ptr", "ptr", SEC_GET_KEY_FN, "ptr", SecHandle.Ptr, "int64*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
