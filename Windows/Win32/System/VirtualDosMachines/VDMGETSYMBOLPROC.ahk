#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETSYMBOLPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETSYMBOLPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {BOOL} param3 
     * @param {BOOL} param4 
     * @param {PSTR} param5 
     * @param {Pointer<Integer>} param6 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param5 := param5 is String ? StrPtr(param5) : param5

        param6Marshal := param6 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", param0, UInt16, param1, UInt32, param2, BOOL, param3, BOOL, param4, "ptr", param5, param6Marshal, param6, BOOL)
        return result
    }

    /**
     * A VDMGETSYMBOLPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETSYMBOLPROC {
        /**
         * Creates a VDMGETSYMBOLPROC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt16, UInt32, BOOL, BOOL, PSTR, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt16, UInt32, BOOL, BOOL, PSTR, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
