#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINRELEASEIPADRESS {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINRELEASEIPADRESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        DllCall(this.value, "ptr", param0, "ptr", param1, param2Marshal, param2)
    }

    /**
     * A PMPRADMINRELEASEIPADRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINRELEASEIPADRESS {
        /**
         * Creates a PMPRADMINRELEASEIPADRESS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
