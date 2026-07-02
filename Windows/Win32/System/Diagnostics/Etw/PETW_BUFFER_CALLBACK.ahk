#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ETW_BUFFER_CALLBACK_INFORMATION.ahk" { ETW_BUFFER_CALLBACK_INFORMATION }

/**
 * Function definition for the BufferCallback that will be invoked by ProcessTrace.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/nc-evntrace-petw_buffer_callback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PETW_BUFFER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PETW_BUFFER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Buffer Pointer to the raw buffer data, which begins with an [ETW_BUFFER_HEADER](ns-evntrace-etw_buffer_header.md) struct and is followed by event data.
     * 
     * By default this buffer is available only until the callback returns. To use the buffer after the callback returns, call [ProcessTraceBufferIncrementReference](nf-evntrace-processtracebufferincrementreference.md). This will keep the buffer available until you call [ProcessTraceBufferDecrementReference](nf-evntrace-processtracebufferdecrementreference.md) on it.
     * 
     * ProcessTrace will not return until all such Buffer references have been decremented.
     * @param {Integer} BufferSize Size of the provided *Buffer*.
     * @param {Pointer<ETW_BUFFER_CALLBACK_INFORMATION>} ConsumerInfo Contains information on the current state of the processing session.
     * @param {Pointer<Void>} CallbackContext User-provided context from [ETW_OPEN_TRACE_OPTIONS.BufferCallbackContext](ns-evntrace-etw_open_trace_options.md).
     * @returns {BOOL} If **TRUE**, the processing will continue. If **FALSE**, trace processing will stop and [ProcessTrace](nf-evntrace-processtrace.md) will return.
     */
    Call(_Buffer, BufferSize, ConsumerInfo, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, _Buffer, UInt32, BufferSize, ETW_BUFFER_CALLBACK_INFORMATION.Ptr, ConsumerInfo, CallbackContextMarshal, CallbackContext, BOOL)
        return result
    }

    /**
     * A PETW_BUFFER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PETW_BUFFER_CALLBACK {
        /**
         * Creates a PETW_BUFFER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, ETW_BUFFER_CALLBACK_INFORMATION, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, ETW_BUFFER_CALLBACK_INFORMATION.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
