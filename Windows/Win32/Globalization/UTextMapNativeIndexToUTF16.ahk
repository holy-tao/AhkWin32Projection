#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextMapNativeIndexToUTF16 {
    value : IntPtr

    __value {
        set {
            if (value is UTextMapNativeIndexToUTF16) {
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
     * @returns {Integer} 
     */
    Call(ut, nativeIndex) {
        result := DllCall(this.value, UText.Ptr, ut, Int64, nativeIndex, Int32)
        return result
    }

    /**
     * A UTextMapNativeIndexToUTF16 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextMapNativeIndexToUTF16 {
        /**
         * Creates a UTextMapNativeIndexToUTF16 pointer that invokes the given AHK function when called.
         * @param {Func(UText, Int64) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, Int64, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
