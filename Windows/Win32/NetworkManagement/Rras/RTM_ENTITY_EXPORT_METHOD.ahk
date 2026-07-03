#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTM_ENTITY_METHOD_INPUT.ahk" { RTM_ENTITY_METHOD_INPUT }
#Import ".\RTM_ENTITY_METHOD_OUTPUT.ahk" { RTM_ENTITY_METHOD_OUTPUT }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_EXPORT_METHOD {
    value : IntPtr

    __value {
        set {
            if (value is RTM_ENTITY_EXPORT_METHOD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CallerHandle 
     * @param {Pointer} CalleeHandle 
     * @param {Pointer<RTM_ENTITY_METHOD_INPUT>} _Input 
     * @param {Pointer<RTM_ENTITY_METHOD_OUTPUT>} Output 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerHandle, CalleeHandle, _Input, Output) {
        DllCall(this.value, IntPtr, CallerHandle, IntPtr, CalleeHandle, RTM_ENTITY_METHOD_INPUT.Ptr, _Input, RTM_ENTITY_METHOD_OUTPUT.Ptr, Output)
    }

    /**
     * A RTM_ENTITY_EXPORT_METHOD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTM_ENTITY_EXPORT_METHOD {
        /**
         * Creates a RTM_ENTITY_EXPORT_METHOD pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, RTM_ENTITY_METHOD_INPUT, RTM_ENTITY_METHOD_OUTPUT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, RTM_ENTITY_METHOD_INPUT.Ptr, RTM_ENTITY_METHOD_OUTPUT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
