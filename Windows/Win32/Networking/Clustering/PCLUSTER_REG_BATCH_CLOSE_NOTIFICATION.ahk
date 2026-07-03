#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGBATCHNOTIFICATION.ahk" { HREGBATCHNOTIFICATION }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGBATCHNOTIFICATION} hBatchNotification 
     * @returns {Integer} 
     */
    Call(hBatchNotification) {
        result := DllCall(this.value, HREGBATCHNOTIFICATION, hBatchNotification, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION {
        /**
         * Creates a PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(HREGBATCHNOTIFICATION) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGBATCHNOTIFICATION, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
