#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HCONN.ahk" { HCONN }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_IIS_GETSERVERVARIABLE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IIS_GETSERVERVARIABLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCONN} param0 
     * @param {PSTR} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCONN, param0, "ptr", param1, param2Marshal, param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A PFN_IIS_GETSERVERVARIABLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IIS_GETSERVERVARIABLE {
        /**
         * Creates a PFN_IIS_GETSERVERVARIABLE pointer that invokes the given AHK function when called.
         * @param {Func(HCONN, PSTR, "ptr", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCONN, PSTR, "ptr", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
