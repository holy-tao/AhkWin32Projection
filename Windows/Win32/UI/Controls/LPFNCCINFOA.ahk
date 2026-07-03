#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CCINFOA.ahk" { CCINFOA }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct LPFNCCINFOA {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCCINFOA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CCINFOA>} acci 
     * @returns {Integer} 
     */
    Call(acci) {
        result := DllCall(this.value, CCINFOA.Ptr, acci, UInt32)
        return result
    }

    /**
     * A LPFNCCINFOA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCCINFOA {
        /**
         * Creates a LPFNCCINFOA pointer that invokes the given AHK function when called.
         * @param {Func(CCINFOA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CCINFOA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
