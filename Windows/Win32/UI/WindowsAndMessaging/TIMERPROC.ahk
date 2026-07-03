#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * An application-defined callback function that processes WM_TIMER messages. The TIMERPROC type defines a pointer to this callback function. TimerProc is a placeholder for the application-defined function name.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-timerproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TIMERPROC {
    value : IntPtr

    __value {
        set {
            if (value is TIMERPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @param {Pointer} param2 
     * @param {Integer} param3 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3) {
        DllCall(this.value, HWND, param0, UInt32, param1, IntPtr, param2, UInt32, param3)
    }

    /**
     * A TIMERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TIMERPROC {
        /**
         * Creates a TIMERPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, IntPtr, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, IntPtr, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
