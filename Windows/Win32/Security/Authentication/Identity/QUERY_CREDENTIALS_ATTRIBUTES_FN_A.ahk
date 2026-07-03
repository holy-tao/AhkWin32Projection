#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct QUERY_CREDENTIALS_ATTRIBUTES_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is QUERY_CREDENTIALS_ATTRIBUTES_FN_A) {
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
     * @param {Pointer<Void>} param2 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, UInt32, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * A QUERY_CREDENTIALS_ATTRIBUTES_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERY_CREDENTIALS_ATTRIBUTES_FN_A {
        /**
         * Creates a QUERY_CREDENTIALS_ATTRIBUTES_FN_A pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, UInt32, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, UInt32, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
