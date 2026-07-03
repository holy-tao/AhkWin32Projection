#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct LPFNOLEUIHOOK {
    value : IntPtr

    __value {
        set {
            if (value is LPFNOLEUIHOOK) {
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
     * @param {WPARAM} param2 
     * @param {LPARAM} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, UInt32)
        return result
    }

    /**
     * A LPFNOLEUIHOOK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNOLEUIHOOK {
        /**
         * Creates a LPFNOLEUIHOOK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
