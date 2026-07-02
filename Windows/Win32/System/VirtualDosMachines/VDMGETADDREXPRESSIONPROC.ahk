#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETADDREXPRESSIONPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETADDREXPRESSIONPROC) {
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
     * @param {PSTR} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "ushort*" : "ptr"

        result := DllCall(this.value, "ptr", param0, "ptr", param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A VDMGETADDREXPRESSIONPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETADDREXPRESSIONPROC {
        /**
         * Creates a VDMGETADDREXPRESSIONPROC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, "ushort*", "uint*", "ushort*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, "ushort*", "uint*", "ushort*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
