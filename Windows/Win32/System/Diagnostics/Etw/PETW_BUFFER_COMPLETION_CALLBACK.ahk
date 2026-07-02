#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_BUFFER_HEADER.ahk" { ETW_BUFFER_HEADER }

/**
 * Function definition for the callback that will be fired when ProcessTraceAddBufferToBufferStream is finished with a buffer. This callback should typically free the buffer as appropriate
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/nc-evntrace-petw_buffer_completion_callback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PETW_BUFFER_COMPLETION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PETW_BUFFER_COMPLETION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<ETW_BUFFER_HEADER>} _Buffer Pointer to the raw ETW buffer
     * @param {Pointer<Void>} CallbackContext User defined context passed in as BufferCompletionContext to [OpenTraceFromBufferStream](nf-evntrace-opentracefrombufferstream.md).
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ETW_BUFFER_HEADER.Ptr, _Buffer, CallbackContextMarshal, CallbackContext)
    }

    /**
     * A PETW_BUFFER_COMPLETION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PETW_BUFFER_COMPLETION_CALLBACK {
        /**
         * Creates a PETW_BUFFER_COMPLETION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(ETW_BUFFER_HEADER, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [ETW_BUFFER_HEADER.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
