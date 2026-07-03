#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMSTARTTASKINWOWPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMSTARTTASKINWOWPROC) {
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
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall(this.value, UInt32, param0, "ptr", param1, UInt16, param2, BOOL)
        return result
    }

    /**
     * A VDMSTARTTASKINWOWPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMSTARTTASKINWOWPROC {
        /**
         * Creates a VDMSTARTTASKINWOWPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, UInt16) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, UInt16, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
