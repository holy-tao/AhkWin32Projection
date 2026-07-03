#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DebugEventLevel.ahk" { DebugEventLevel }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct DebugEventProc {
    value : IntPtr

    __value {
        set {
            if (value is DebugEventProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DebugEventLevel} level 
     * @param {PSTR} message 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(level, message) {
        message := message is String ? StrPtr(message) : message

        DllCall(this.value, DebugEventLevel, level, "ptr", message)
    }

    /**
     * A DebugEventProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DebugEventProc {
        /**
         * Creates a DebugEventProc pointer that invokes the given AHK function when called.
         * @param {Func(DebugEventLevel, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DebugEventLevel, PSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
