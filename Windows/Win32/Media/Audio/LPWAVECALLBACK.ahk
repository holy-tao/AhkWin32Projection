#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Multimedia\HDRVR.ahk" { HDRVR }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct LPWAVECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPWAVECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDRVR} _hdrvr 
     * @param {Integer} uMsg 
     * @param {Pointer} dwUser 
     * @param {Pointer} dw1 
     * @param {Pointer} dw2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_hdrvr, uMsg, dwUser, dw1, dw2) {
        DllCall(this.value, HDRVR, _hdrvr, UInt32, uMsg, IntPtr, dwUser, IntPtr, dw1, IntPtr, dw2)
    }

    /**
     * A LPWAVECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWAVECALLBACK {
        /**
         * Creates a LPWAVECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HDRVR, UInt32, IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDRVR, UInt32, IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
