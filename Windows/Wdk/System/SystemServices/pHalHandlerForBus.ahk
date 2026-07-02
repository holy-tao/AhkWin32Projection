#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import "..\..\Foundation\PBUS_HANDLER.ahk" { PBUS_HANDLER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalHandlerForBus {
    value : IntPtr

    __value {
        set {
            if (value is pHalHandlerForBus) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {INTERFACE_TYPE} InterfaceType 
     * @param {Integer} BusNumber 
     * @returns {PBUS_HANDLER} 
     */
    Call(InterfaceType, BusNumber) {
        result := DllCall(this.value, INTERFACE_TYPE, InterfaceType, UInt32, BusNumber, PBUS_HANDLER)
        return result
    }

    /**
     * A pHalHandlerForBus that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalHandlerForBus {
        /**
         * Creates a pHalHandlerForBus pointer that invokes the given AHK function when called.
         * @param {Func(INTERFACE_TYPE, UInt32) => PBUS_HANDLER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INTERFACE_TYPE, UInt32, PBUS_HANDLER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
