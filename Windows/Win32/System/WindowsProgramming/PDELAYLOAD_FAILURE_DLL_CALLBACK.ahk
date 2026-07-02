#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DELAYLOAD_INFO.ahk" { DELAYLOAD_INFO }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PDELAYLOAD_FAILURE_DLL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDELAYLOAD_FAILURE_DLL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} NotificationReason 
     * @param {Pointer<DELAYLOAD_INFO>} DelayloadInfo 
     * @returns {Pointer<Void>} 
     */
    Call(NotificationReason, DelayloadInfo) {
        result := DllCall(this.value, UInt32, NotificationReason, DELAYLOAD_INFO.Ptr, DelayloadInfo, IntPtr)
        return result
    }

    /**
     * A PDELAYLOAD_FAILURE_DLL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDELAYLOAD_FAILURE_DLL_CALLBACK {
        /**
         * Creates a PDELAYLOAD_FAILURE_DLL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, DELAYLOAD_INFO) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, DELAYLOAD_INFO.Ptr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
