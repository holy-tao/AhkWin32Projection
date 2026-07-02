#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WNDENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is WNDENUMPROC) {
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
     * @param {LPARAM} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, HWND, param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A WNDENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WNDENUMPROC {
        /**
         * Creates a WNDENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
