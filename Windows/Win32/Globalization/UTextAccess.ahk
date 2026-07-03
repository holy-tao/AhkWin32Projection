#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextAccess {
    value : IntPtr

    __value {
        set {
            if (value is UTextAccess) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UText>} ut 
     * @param {Integer} nativeIndex 
     * @param {Integer} forward 
     * @returns {Integer} 
     */
    Call(ut, nativeIndex, forward) {
        result := DllCall(this.value, UText.Ptr, ut, Int64, nativeIndex, Int8, forward, Int8)
        return result
    }

    /**
     * A UTextAccess that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextAccess {
        /**
         * Creates a UTextAccess pointer that invokes the given AHK function when called.
         * @param {Func(UText, Int64, Int8) => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, Int64, Int8, Int8])
        }

        __Delete() => CallbackFree(this.value)
    }
}
