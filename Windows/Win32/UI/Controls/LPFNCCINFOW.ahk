#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CCINFOW.ahk" { CCINFOW }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct LPFNCCINFOW {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCCINFOW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CCINFOW>} acci 
     * @returns {Integer} 
     */
    Call(acci) {
        result := DllCall(this.value, CCINFOW.Ptr, acci, UInt32)
        return result
    }

    /**
     * A LPFNCCINFOW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCCINFOW {
        /**
         * Creates a LPFNCCINFOW pointer that invokes the given AHK function when called.
         * @param {Func(CCINFOW) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CCINFOW.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
