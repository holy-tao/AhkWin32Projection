#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CCSTYLEA.ahk" { CCSTYLEA }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct LPFNCCSTYLEA {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCCSTYLEA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<CCSTYLEA>} pccs 
     * @returns {BOOL} 
     */
    Call(hwndParent, pccs) {
        result := DllCall(this.value, HWND, hwndParent, CCSTYLEA.Ptr, pccs, BOOL)
        return result
    }

    /**
     * A LPFNCCSTYLEA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCCSTYLEA {
        /**
         * Creates a LPFNCCSTYLEA pointer that invokes the given AHK function when called.
         * @param {Func(HWND, CCSTYLEA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, CCSTYLEA.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
