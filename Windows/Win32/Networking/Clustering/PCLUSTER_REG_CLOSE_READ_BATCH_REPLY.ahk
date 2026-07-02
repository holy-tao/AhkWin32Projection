#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGREADBATCHREPLY.ahk" { HREGREADBATCHREPLY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CLOSE_READ_BATCH_REPLY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CLOSE_READ_BATCH_REPLY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGREADBATCHREPLY} _hRegReadBatchReply 
     * @returns {Integer} 
     */
    Call(_hRegReadBatchReply) {
        result := DllCall(this.value, HREGREADBATCHREPLY, _hRegReadBatchReply, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CLOSE_READ_BATCH_REPLY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CLOSE_READ_BATCH_REPLY {
        /**
         * Creates a PCLUSTER_REG_CLOSE_READ_BATCH_REPLY pointer that invokes the given AHK function when called.
         * @param {Func(HREGREADBATCHREPLY) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGREADBATCHREPLY, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
