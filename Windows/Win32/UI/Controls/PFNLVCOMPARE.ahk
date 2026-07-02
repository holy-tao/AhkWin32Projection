#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNLVCOMPARE {
    value : IntPtr

    __value {
        set {
            if (value is PFNLVCOMPARE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} param0 
     * @param {LPARAM} param1 
     * @param {LPARAM} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, LPARAM, param0, LPARAM, param1, LPARAM, param2, Int32)
        return result
    }

    /**
     * A PFNLVCOMPARE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNLVCOMPARE {
        /**
         * Creates a PFNLVCOMPARE pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, LPARAM, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, LPARAM, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
