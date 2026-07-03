#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct ADD_CREDENTIALS_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is ADD_CREDENTIALS_FN_A) {
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
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Pointer<SEC_GET_KEY_FN>} param5 
     * @param {Pointer<Void>} param6 
     * @param {Pointer<Integer>} param7 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"
        param7Marshal := param7 is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, param1Marshal, param1, param2Marshal, param2, UInt32, param3, param4Marshal, param4, "ptr", param5, param6Marshal, param6, param7Marshal, param7, "HRESULT")
        return result
    }

    /**
     * A ADD_CREDENTIALS_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ADD_CREDENTIALS_FN_A {
        /**
         * Creates a ADD_CREDENTIALS_FN_A pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, "char*", "char*", UInt32, "ptr", "ptr", "ptr", "int64*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, "char*", "char*", UInt32, "ptr", "ptr", "ptr", "int64*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
