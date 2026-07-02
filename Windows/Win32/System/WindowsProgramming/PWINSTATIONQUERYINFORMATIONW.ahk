#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WINSTATIONINFOCLASS.ahk" { WINSTATIONINFOCLASS }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWINSTATIONQUERYINFORMATIONW {
    value : IntPtr

    __value {
        set {
            if (value is PWINSTATIONQUERYINFORMATIONW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Integer} param1 
     * @param {WINSTATIONINFOCLASS} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {BOOLEAN} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, UInt32, param1, WINSTATIONINFOCLASS, param2, param3Marshal, param3, UInt32, param4, param5Marshal, param5, BOOLEAN)
        return result
    }

    /**
     * A PWINSTATIONQUERYINFORMATIONW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINSTATIONQUERYINFORMATIONW {
        /**
         * Creates a PWINSTATIONQUERYINFORMATIONW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, WINSTATIONINFOCLASS, "ptr", UInt32, "uint*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, WINSTATIONINFOCLASS, "ptr", UInt32, "uint*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
