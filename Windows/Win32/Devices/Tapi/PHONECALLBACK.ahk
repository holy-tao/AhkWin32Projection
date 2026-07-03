#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The phoneCallback function is a placeholder for the application-supplied function name.
 * @remarks
 * For more information about the parameters passed to this callback function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-messages">TAPI Messages</a>.
 * 
 * All callbacks occur in the application's context. The callback function must reside in a dynamic-link library (DLL) or application module and be exported in the module-definition file.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/nc-tapi-phonecallback
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PHONECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} hDevice Handle to a phone device associated with the callback.
     * @param {Integer} dwMessage 
     * @param {Pointer} dwInstance 
     * @param {Pointer} dwParam1 Parameter for the message.
     * @param {Pointer} dwParam2 Parameter for the message.
     * @param {Pointer} dwParam3 Parameter for the message.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hDevice, dwMessage, dwInstance, dwParam1, dwParam2, dwParam3) {
        DllCall(this.value, UInt32, hDevice, UInt32, dwMessage, IntPtr, dwInstance, IntPtr, dwParam1, IntPtr, dwParam2, IntPtr, dwParam3)
    }

    /**
     * A PHONECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHONECALLBACK {
        /**
         * Creates a PHONECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, IntPtr, IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
