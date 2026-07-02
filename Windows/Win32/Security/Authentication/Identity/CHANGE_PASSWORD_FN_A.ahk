#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct CHANGE_PASSWORD_FN_A {
    value : IntPtr

    __value {
        set {
            if (value is CHANGE_PASSWORD_FN_A) {
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
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {BOOLEAN} param5 
     * @param {Integer} param6 
     * @param {Pointer<SecBufferDesc>} param7 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param0Marshal := param0 is VarRef ? "char*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "char*" : "ptr"
        param3Marshal := param3 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4, BOOLEAN, param5, UInt32, param6, SecBufferDesc.Ptr, param7, "HRESULT")
        return result
    }

    /**
     * A CHANGE_PASSWORD_FN_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CHANGE_PASSWORD_FN_A {
        /**
         * Creates a CHANGE_PASSWORD_FN_A pointer that invokes the given AHK function when called.
         * @param {Func("char*", "char*", "char*", "char*", "char*", BOOLEAN, UInt32, SecBufferDesc) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", "char*", "char*", "char*", "char*", BOOLEAN, UInt32, SecBufferDesc.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
