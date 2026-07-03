#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PCHANNEL_INIT_EVENT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PCHANNEL_INIT_EVENT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pInitHandle 
     * @param {Integer} event 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dataLength 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pInitHandle, event, pData, dataLength) {
        pInitHandleMarshal := pInitHandle is VarRef ? "ptr" : "ptr"
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pInitHandleMarshal, pInitHandle, UInt32, event, pDataMarshal, pData, UInt32, dataLength)
    }

    /**
     * A PCHANNEL_INIT_EVENT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCHANNEL_INIT_EVENT_FN {
        /**
         * Creates a PCHANNEL_INIT_EVENT_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
