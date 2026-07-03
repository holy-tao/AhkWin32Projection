#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCS_EVENT.ahk" { HCS_EVENT }

/**
 * HCS_EVENT_CALLBACK
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_CALLBACK
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_EVENT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is HCS_EVENT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<HCS_EVENT>} event Handle to the pointer of [`HCS_EVENT`](./HCS_EVENT.md).
     * @param {Pointer<Void>} _context Handle for context of callback.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(event, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HCS_EVENT.Ptr, event, _contextMarshal, _context)
    }

    /**
     * A HCS_EVENT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HCS_EVENT_CALLBACK {
        /**
         * Creates a HCS_EVENT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HCS_EVENT, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCS_EVENT.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
