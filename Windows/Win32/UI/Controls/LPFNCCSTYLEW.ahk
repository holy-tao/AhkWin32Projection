#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CCSTYLEW.ahk" { CCSTYLEW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct LPFNCCSTYLEW {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCCSTYLEW) {
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
     * @param {Pointer<CCSTYLEW>} pccs 
     * @returns {BOOL} 
     */
    Call(hwndParent, pccs) {
        result := DllCall(this.value, HWND, hwndParent, CCSTYLEW.Ptr, pccs, BOOL)
        return result
    }

    /**
     * A LPFNCCSTYLEW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCCSTYLEW {
        /**
         * Creates a LPFNCCSTYLEW pointer that invokes the given AHK function when called.
         * @param {Func(HWND, CCSTYLEW) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, CCSTYLEW.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
