#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct PHANDLER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PHANDLER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} CtrlType 
     * @returns {BOOL} 
     */
    Call(CtrlType) {
        result := DllCall(this.value, UInt32, CtrlType, BOOL)
        return result
    }

    /**
     * A PHANDLER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHANDLER_ROUTINE {
        /**
         * Creates a PHANDLER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
