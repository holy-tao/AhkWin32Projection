#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DECODE_ERROR.ahk" { DEBUG_DECODE_ERROR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_DECODE_ERROR {
    value : IntPtr

    __value {
        set {
            if (value is EXT_DECODE_ERROR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEBUG_DECODE_ERROR>} pDecodeError 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pDecodeError) {
        DllCall(this.value, DEBUG_DECODE_ERROR.Ptr, pDecodeError)
    }

    /**
     * A EXT_DECODE_ERROR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_DECODE_ERROR {
        /**
         * Creates a EXT_DECODE_ERROR pointer that invokes the given AHK function when called.
         * @param {Func(DEBUG_DECODE_ERROR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEBUG_DECODE_ERROR.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
