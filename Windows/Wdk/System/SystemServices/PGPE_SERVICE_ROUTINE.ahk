#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGPE_SERVICE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PGPE_SERVICE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOLEAN} 
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, BOOLEAN)
        return result
    }

    /**
     * A PGPE_SERVICE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGPE_SERVICE_ROUTINE {
        /**
         * Creates a PGPE_SERVICE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
