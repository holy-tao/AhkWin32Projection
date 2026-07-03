#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOLSERVERMESSAGEPROC {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERMESSAGEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} action 
     * @param {Integer} data 
     * @param {Integer} _context 
     * @returns {BOOL} 
     */
    Call(action, data, _context) {
        result := DllCall(this.value, IntPtr, action, Int64, data, Int64, _context, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERMESSAGEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERMESSAGEPROC {
        /**
         * Creates a PSYMBOLSERVERMESSAGEPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int64, Int64) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Int64, Int64, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
