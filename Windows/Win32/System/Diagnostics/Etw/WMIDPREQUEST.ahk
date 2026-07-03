#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMIDPREQUESTCODE.ahk" { WMIDPREQUESTCODE }

/**
 * A RegisterTraceGuids-based ("Classic") event provider implements this function to receive notifications from controllers. The WMIDPREQUEST type defines a pointer to this callback function. ControlCallback is a placeholder for the application-defined function name.
 * @remarks
 * This function is specified using the
 * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
 * function. When the controller calls the
 * [EnableTrace](/windows/desktop/ETW/enabletrace) function to enable, disable, or
 * change the enable flags or level, ETW calls this callback. The provider enables
 * or disables itself based on the _RequestCode_ value. Typically, the provider uses
 * this value to set a global flag to indicate its enabled state.
 * 
 * The provider defines its interpretation of being enabled or disabled. Generally,
 * if a provider is enabled, it generates events, but while it is disabled, it does
 * not.
 * 
 * ETW does not pass the enable flags and enable level that the controller passes
 * to the [EnableTrace](/windows/desktop/ETW/enabletrace) function to this
 * callback. To retrieve this information, call the
 * [GetTraceEnableFlags](/windows/desktop/ETW/gettraceenableflags) and
 * [GetTraceEnableLevel](/windows/desktop/ETW/gettraceenablelevel) functions,
 * respectively.
 * 
 * You also need to retrieve the session handle in this callback for future calls.
 * To retrieve the session handle, call the
 * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function.
 * 
 * Your callback function must not call anything that may incur LoadLibrary (more
 * specifically, anything that requires a loader lock).
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/nc-evntrace-wmidprequest
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WMIDPREQUEST {
    value : IntPtr

    __value {
        set {
            if (value is WMIDPREQUEST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WMIDPREQUESTCODE} RequestCode 
     * @param {Pointer<Void>} RequestContext Provider-defined context. The provider uses the _RequestContext_ parameter of  
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * to specify the context.
     * @param {Pointer<Integer>} BufferSize Reserved for internal use.
     * @param {Pointer<Void>} _Buffer Pointer to a [WNODE_HEADER](/windows/desktop/ETW/wnode-header) structure that
     * contains information about the event tracing session for which the provider is
     * being enabled or disabled.
     * @returns {Integer} You should return ERROR_SUCCESS if the callback succeeds. Note that ETW ignores
     * the return value for this function except when a controller calls
     * [EnableTrace](/windows/desktop/ETW/enabletrace) to enable a provider and the
     * provider has not yet called
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa).
     * When this occurs, **RegisterTraceGuids** will return the return value of this
     * callback if the registration was successful.
     */
    Call(RequestCode, RequestContext, BufferSize, _Buffer) {
        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, WMIDPREQUESTCODE, RequestCode, RequestContextMarshal, RequestContext, BufferSizeMarshal, BufferSize, _BufferMarshal, _Buffer, UInt32)
        return result
    }

    /**
     * A WMIDPREQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WMIDPREQUEST {
        /**
         * Creates a WMIDPREQUEST pointer that invokes the given AHK function when called.
         * @param {Func(WMIDPREQUESTCODE, "ptr", "uint*", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WMIDPREQUESTCODE, "ptr", "uint*", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
