#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EventBuffer 
     * @param {Pointer} EntrySize 
     * @param {Pointer} NumberOfEntries 
     * @param {HANDLE} OwningHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(EventBuffer, EntrySize, NumberOfEntries, OwningHandle) {
        EventBufferMarshal := EventBuffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EventBufferMarshal, EventBuffer, IntPtr, EntrySize, IntPtr, NumberOfEntries, HANDLE, OwningHandle)
    }

    /**
     * A PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER {
        /**
         * Creates a PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, IntPtr, HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, IntPtr, HANDLE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
