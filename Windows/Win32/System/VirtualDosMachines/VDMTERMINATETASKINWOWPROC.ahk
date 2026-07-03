#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMTERMINATETASKINWOWPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMTERMINATETASKINWOWPROC) {
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
     * @param {Integer} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, UInt32, param0, UInt16, param1, BOOL)
        return result
    }

    /**
     * A VDMTERMINATETASKINWOWPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMTERMINATETASKINWOWPROC {
        /**
         * Creates a VDMTERMINATETASKINWOWPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt16) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt16, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
