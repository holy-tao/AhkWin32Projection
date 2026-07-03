#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * The LineDDAProc function is an application-defined callback function used with the LineDDA function.
 * @remarks
 * An application registers a <b>LineDDAProc</b> function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-linedda">LineDDA</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-lineddaproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct LINEDDAPROC {
    value : IntPtr

    __value {
        set {
            if (value is LINEDDAPROC) {
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
     * @param {LPARAM} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        DllCall(this.value, Int32, param0, Int32, param1, LPARAM, param2)
    }

    /**
     * A LINEDDAPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LINEDDAPROC {
        /**
         * Creates a LINEDDAPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32, Int32, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, Int32, LPARAM, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
