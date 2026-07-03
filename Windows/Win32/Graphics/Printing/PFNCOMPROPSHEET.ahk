#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFNCOMPROPSHEET {
    value : IntPtr

    __value {
        set {
            if (value is PFNCOMPROPSHEET) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hComPropSheet 
     * @param {Integer} Function 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {Pointer} 
     */
    Call(hComPropSheet, Function, lParam1, lParam2) {
        result := DllCall(this.value, HANDLE, hComPropSheet, UInt32, Function, LPARAM, lParam1, LPARAM, lParam2, IntPtr)
        return result
    }

    /**
     * A PFNCOMPROPSHEET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCOMPROPSHEET {
        /**
         * Creates a PFNCOMPROPSHEET pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, LPARAM, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, LPARAM, LPARAM, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
