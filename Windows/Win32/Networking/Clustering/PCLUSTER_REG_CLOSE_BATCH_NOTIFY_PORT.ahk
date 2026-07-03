#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGBATCHPORT.ahk" { HREGBATCHPORT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGBATCHPORT} hBatchNotifyPort 
     * @returns {Integer} 
     */
    Call(hBatchNotifyPort) {
        result := DllCall(this.value, HREGBATCHPORT, hBatchNotifyPort, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT {
        /**
         * Creates a PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT pointer that invokes the given AHK function when called.
         * @param {Func(HREGBATCHPORT) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGBATCHPORT, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
