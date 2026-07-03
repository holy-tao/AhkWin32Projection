#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMENUMTASKWOWEXPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMENUMTASKWOWEXPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<TASKENUMPROCEX>} param1 
     * @param {LPARAM} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, UInt32, param0, "ptr", param1, LPARAM, param2, Int32)
        return result
    }

    /**
     * A VDMENUMTASKWOWEXPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMENUMTASKWOWEXPROC {
        /**
         * Creates a VDMENUMTASKWOWEXPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
