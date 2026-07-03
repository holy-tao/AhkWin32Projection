#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The lineCallback function is a placeholder for the application-supplied function name.
 * @remarks
 * For information about parameter values passed to this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-device-messages">Line Device Messages</a>.
 * 
 * All callbacks occur in the application's context. The callback function must reside in a DLL or application module.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/nc-tapi-linecallback
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LINECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} hDevice Handle to either a line device or a call associated with the callback. The nature of this handle (line handle or call handle) can be determined by the context provided by <i>dwMsg</i>. Applications must use the <b>DWORD</b> type for this parameter because using the <b>HANDLE</b> type may generate an error.
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
     * A LINECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LINECALLBACK {
        /**
         * Creates a LINECALLBACK pointer that invokes the given AHK function when called.
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
