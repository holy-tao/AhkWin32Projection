#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTM_EVENT_TYPE.ahk" { RTM_EVENT_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_EVENT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is RTM_EVENT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} RtmRegHandle 
     * @param {RTM_EVENT_TYPE} EventType 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @returns {Integer} 
     */
    Call(RtmRegHandle, EventType, Context1, Context2) {
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, RtmRegHandle, RTM_EVENT_TYPE, EventType, Context1Marshal, Context1, Context2Marshal, Context2, UInt32)
        return result
    }

    /**
     * A RTM_EVENT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTM_EVENT_CALLBACK {
        /**
         * Creates a RTM_EVENT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, RTM_EVENT_TYPE, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, RTM_EVENT_TYPE, "ptr", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
