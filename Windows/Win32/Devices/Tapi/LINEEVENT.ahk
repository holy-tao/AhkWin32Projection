#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTAPICALL.ahk" { HTAPICALL }
#Import ".\HTAPILINE.ahk" { HTAPILINE }

/**
 * Line_Event is a callback function implemented by TAPI and supplied to the service provider as a parameter to TSPI_lineOpen. The service provider calls this function to report events that occur on the line or on calls on the line.
 * @remarks
 * The call state when calling this function can be any state.
 * 
 * The service provider passes the 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/htapiline">HTAPILINE</a> value supplied to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_lineopen">TSPI_lineOpen</a> as the <i>htLine</i> parameter. It includes the message identifier and parameters specific to the event.
 * 
 * This function differs from the callback function defined at the TAPI level in that it separates line and call parameters. Both parameters are used for some messages. The sets of messages that can be passed to this procedure differ slightly from the TAPI level. In particular, completion of asynchronously executing requests is reported through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-async_completion">Completion_Proc</a> callback instead of this one.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/nc-tspi-lineevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEEVENT {
    value : IntPtr

    __value {
        set {
            if (value is LINEEVENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HTAPILINE} htLine The TAPI handle for the line on which the event occurred.
     * @param {HTAPICALL} htCall The TAPI handle for the call on which the event occurred if this is a call-related event. For line-related events where there is no call, this parameter is set to <b>NULL</b>.
     * @param {Integer} dwMsg Specifies the kind of event that is being reported. Interpretation of the other parameters is performed in different ways according to the context indicated by <i>dwMsg</i>.
     * @param {Pointer} dwParam1 A parameter for the message.
     * @param {Pointer} dwParam2 A parameter for the message.
     * @param {Pointer} dwParam3 A parameter for the message.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(htLine, htCall, dwMsg, dwParam1, dwParam2, dwParam3) {
        DllCall(this.value, HTAPILINE, htLine, HTAPICALL, htCall, UInt32, dwMsg, IntPtr, dwParam1, IntPtr, dwParam2, IntPtr, dwParam3)
    }

    /**
     * A LINEEVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LINEEVENT {
        /**
         * Creates a LINEEVENT pointer that invokes the given AHK function when called.
         * @param {Func(HTAPILINE, HTAPICALL, UInt32, IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HTAPILINE, HTAPICALL, UInt32, IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
