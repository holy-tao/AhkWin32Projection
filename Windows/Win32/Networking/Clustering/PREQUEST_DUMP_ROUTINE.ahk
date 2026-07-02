#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PREQUEST_DUMP_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PREQUEST_DUMP_ROUTINE) {
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
     * @param {BOOL} DumpDueToCallInProgress 
     * @param {Integer} DumpDelayInMs 
     * @returns {Integer} 
     */
    Call(ResourceHandle, DumpDueToCallInProgress, DumpDelayInMs) {
        result := DllCall(this.value, IntPtr, ResourceHandle, BOOL, DumpDueToCallInProgress, UInt32, DumpDelayInMs, UInt32)
        return result
    }

    /**
     * A PREQUEST_DUMP_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREQUEST_DUMP_ROUTINE {
        /**
         * Creates a PREQUEST_DUMP_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, BOOL, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
