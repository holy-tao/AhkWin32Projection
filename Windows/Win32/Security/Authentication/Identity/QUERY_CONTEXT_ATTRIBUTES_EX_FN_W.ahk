#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct QUERY_CONTEXT_ATTRIBUTES_EX_FN_W {
    value : IntPtr

    __value {
        set {
            if (value is QUERY_CONTEXT_ATTRIBUTES_EX_FN_W) {
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
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SecHandle.Ptr, param0, UInt32, param1, param2Marshal, param2, UInt32, param3, "HRESULT")
        return result
    }

    /**
     * A QUERY_CONTEXT_ATTRIBUTES_EX_FN_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERY_CONTEXT_ATTRIBUTES_EX_FN_W {
        /**
         * Creates a QUERY_CONTEXT_ATTRIBUTES_EX_FN_W pointer that invokes the given AHK function when called.
         * @param {Func(SecHandle, UInt32, "ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecHandle.Ptr, UInt32, "ptr", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
