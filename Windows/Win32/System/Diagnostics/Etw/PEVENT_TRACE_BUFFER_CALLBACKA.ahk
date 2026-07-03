#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENT_TRACE_LOGFILEA.ahk" { EVENT_TRACE_LOGFILEA }

/**
 * The PEVENT_TRACE_BUFFER_CALLBACKA (ANSI) (evntrace.h) function gets statistics about each buffer of events that ETW sends during a trace processing session.
 * @remarks
 * To specify the function that ETW calls to deliver the buffer statistics, set the
 * **BufferCallback** member of the
 * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea)
 * structure that you pass to the
 * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) function.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @charset ANSI
 */
export default struct PEVENT_TRACE_BUFFER_CALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is PEVENT_TRACE_BUFFER_CALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EVENT_TRACE_LOGFILEA>} Logfile Pointer to an
     * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea)
     * structure that contains information about the buffer.
     * @returns {Integer} To continue processing events, return **TRUE**. Otherwise, return **FALSE**.
     * Returning **FALSE** will terminate the
     * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function.
     */
    Call(Logfile) {
        result := DllCall(this.value, EVENT_TRACE_LOGFILEA.Ptr, Logfile, UInt32)
        return result
    }

    /**
     * A PEVENT_TRACE_BUFFER_CALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PEVENT_TRACE_BUFFER_CALLBACKA {
        /**
         * Creates a PEVENT_TRACE_BUFFER_CALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(EVENT_TRACE_LOGFILEA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EVENT_TRACE_LOGFILEA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
