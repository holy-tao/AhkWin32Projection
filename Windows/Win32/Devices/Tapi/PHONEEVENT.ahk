#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTAPIPHONE.ahk" { HTAPIPHONE }

/**
 * Phone_Event a callback function implemented by TAPI and supplied to the service provider as a parameter to TSPI_phoneOpen. The service provider calls this function to report events that occur on the phone.
 * @remarks
 * The call state when calling this function can be any state.
 * 
 * The service provider passes the 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/htapiphone">HTAPIPHONE</a> value supplied to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_phoneopen">TSPI_phoneOpen</a> as the <i>htPhone</i> parameter. It includes the message identifier and parameters specific to the event.
 * 
 * The sets of messages that can be passed to this procedure differ slightly from the messages to the corresponding callback at the TAPI level. In particular, completion of asynchronously executing requests is reported through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-async_completion">Completion_Proc</a> callback instead of this one.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/nc-tspi-phoneevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONEEVENT {
    value : IntPtr

    __value {
        set {
            if (value is PHONEEVENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HTAPIPHONE} htPhone The TAPI handle for the phone on which the event occurred.
     * @param {Integer} dwMsg Specifies the kind of event that is being reported. Interpretation of the other parameters is done in different ways according to the context indicated by <i>dwMsg</i>.
     * @param {Pointer} dwParam1 A parameter for the message.
     * @param {Pointer} dwParam2 A parameter for the message.
     * @param {Pointer} dwParam3 A parameter for the message.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(htPhone, dwMsg, dwParam1, dwParam2, dwParam3) {
        DllCall(this.value, HTAPIPHONE, htPhone, UInt32, dwMsg, IntPtr, dwParam1, IntPtr, dwParam2, IntPtr, dwParam3)
    }

    /**
     * A PHONEEVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHONEEVENT {
        /**
         * Creates a PHONEEVENT pointer that invokes the given AHK function when called.
         * @param {Func(HTAPIPHONE, UInt32, IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HTAPIPHONE, UInt32, IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
