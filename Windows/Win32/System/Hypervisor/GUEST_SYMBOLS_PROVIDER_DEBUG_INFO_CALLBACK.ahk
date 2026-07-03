#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} InfoMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(InfoMessage) {
        InfoMessage := InfoMessage is String ? StrPtr(InfoMessage) : InfoMessage

        DllCall(this.value, "ptr", InfoMessage)
    }

    /**
     * A GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK {
        /**
         * Creates a GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
