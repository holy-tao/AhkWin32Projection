#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PCHANNEL_OPEN_EVENT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PCHANNEL_OPEN_EVENT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} openHandle 
     * @param {Integer} event 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dataLength 
     * @param {Integer} totalLength 
     * @param {Integer} dataFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(openHandle, event, pData, dataLength, totalLength, dataFlags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, openHandle, UInt32, event, pDataMarshal, pData, UInt32, dataLength, UInt32, totalLength, UInt32, dataFlags)
    }

    /**
     * A PCHANNEL_OPEN_EVENT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCHANNEL_OPEN_EVENT_FN {
        /**
         * Creates a PCHANNEL_OPEN_EVENT_FN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "ptr", UInt32, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "ptr", UInt32, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
