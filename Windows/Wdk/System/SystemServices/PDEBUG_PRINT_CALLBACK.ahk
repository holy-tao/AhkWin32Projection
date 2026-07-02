#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\STRING.ahk" { STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PDEBUG_PRINT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_PRINT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<STRING>} Output 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Output, ComponentId, Level) {
        DllCall(this.value, STRING.Ptr, Output, UInt32, ComponentId, UInt32, Level)
    }

    /**
     * A PDEBUG_PRINT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_PRINT_CALLBACK {
        /**
         * Creates a PDEBUG_PRINT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(STRING, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [STRING.Ptr, UInt32, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
