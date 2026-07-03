#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle 
     * @param {Integer} TimeoutInMs 
     * @returns {Integer} 
     */
    Call(ResourceHandle, TimeoutInMs) {
        result := DllCall(this.value, IntPtr, ResourceHandle, Int64, TimeoutInMs, UInt32)
        return result
    }

    /**
     * A PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE {
        /**
         * Creates a PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int64) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Int64, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
