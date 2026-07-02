#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PBUS_HANDLER.ahk" { PBUS_HANDLER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalReferenceBusHandler {
    value : IntPtr

    __value {
        set {
            if (value is pHalReferenceBusHandler) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PBUS_HANDLER} BusHandler 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(BusHandler) {
        DllCall(this.value, PBUS_HANDLER, BusHandler)
    }

    /**
     * A pHalReferenceBusHandler that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalReferenceBusHandler {
        /**
         * Creates a pHalReferenceBusHandler pointer that invokes the given AHK function when called.
         * @param {Func(PBUS_HANDLER) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PBUS_HANDLER, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
