#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNTVCOMPARE {
    value : IntPtr

    __value {
        set {
            if (value is PFNTVCOMPARE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @param {LPARAM} lParamSort 
     * @returns {Integer} 
     */
    Call(lParam1, lParam2, lParamSort) {
        result := DllCall(this.value, LPARAM, lParam1, LPARAM, lParam2, LPARAM, lParamSort, Int32)
        return result
    }

    /**
     * A PFNTVCOMPARE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNTVCOMPARE {
        /**
         * Creates a PFNTVCOMPARE pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, LPARAM, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, LPARAM, LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
