#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMENUMPROCESSWOWPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMENUMPROCESSWOWPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PROCESSENUMPROC>} param0 
     * @param {LPARAM} param1 
     * @returns {Integer} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, "ptr", param0, LPARAM, param1, Int32)
        return result
    }

    /**
     * A VDMENUMPROCESSWOWPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMENUMPROCESSWOWPROC {
        /**
         * Creates a VDMENUMPROCESSWOWPROC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
