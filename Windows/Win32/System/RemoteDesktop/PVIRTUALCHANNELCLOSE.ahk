#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PVIRTUALCHANNELCLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PVIRTUALCHANNELCLOSE) {
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
     * @returns {Integer} 
     */
    Call(openHandle) {
        result := DllCall(this.value, UInt32, openHandle, UInt32)
        return result
    }

    /**
     * A PVIRTUALCHANNELCLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIRTUALCHANNELCLOSE {
        /**
         * Creates a PVIRTUALCHANNELCLOSE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
