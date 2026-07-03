#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGBATCHNOTIFICATION.ahk" { HREGBATCHNOTIFICATION }
#Import ".\HREGBATCHPORT.ahk" { HREGBATCHPORT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_GET_BATCH_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_GET_BATCH_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGBATCHPORT} hBatchNotify 
     * @param {Pointer<HREGBATCHNOTIFICATION>} phBatchNotification 
     * @returns {Integer} 
     */
    Call(hBatchNotify, phBatchNotification) {
        phBatchNotificationMarshal := phBatchNotification is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HREGBATCHPORT, hBatchNotify, phBatchNotificationMarshal, phBatchNotification, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_GET_BATCH_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_GET_BATCH_NOTIFICATION {
        /**
         * Creates a PCLUSTER_REG_GET_BATCH_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(HREGBATCHPORT, HREGBATCHNOTIFICATION) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGBATCHPORT, HREGBATCHNOTIFICATION.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
