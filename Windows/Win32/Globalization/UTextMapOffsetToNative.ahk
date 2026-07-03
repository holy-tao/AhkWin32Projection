#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextMapOffsetToNative {
    value : IntPtr

    __value {
        set {
            if (value is UTextMapOffsetToNative) {
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
     * @returns {Integer} 
     */
    Call(ut) {
        result := DllCall(this.value, UText.Ptr, ut, Int64)
        return result
    }

    /**
     * A UTextMapOffsetToNative that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextMapOffsetToNative {
        /**
         * Creates a UTextMapOffsetToNative pointer that invokes the given AHK function when called.
         * @param {Func(UText) => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, Int64])
        }

        __Delete() => CallbackFree(this.value)
    }
}
