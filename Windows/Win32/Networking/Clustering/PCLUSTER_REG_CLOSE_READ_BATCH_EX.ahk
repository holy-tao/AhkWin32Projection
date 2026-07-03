#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGREADBATCH.ahk" { HREGREADBATCH }
#Import ".\HREGREADBATCHREPLY.ahk" { HREGREADBATCHREPLY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CLOSE_READ_BATCH_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CLOSE_READ_BATCH_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGREADBATCH} _hRegReadBatch 
     * @param {Integer} flags 
     * @param {Pointer<HREGREADBATCHREPLY>} phRegReadBatchReply 
     * @returns {Integer} 
     */
    Call(_hRegReadBatch, flags, phRegReadBatchReply) {
        phRegReadBatchReplyMarshal := phRegReadBatchReply is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HREGREADBATCH, _hRegReadBatch, UInt32, flags, phRegReadBatchReplyMarshal, phRegReadBatchReply, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CLOSE_READ_BATCH_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CLOSE_READ_BATCH_EX {
        /**
         * Creates a PCLUSTER_REG_CLOSE_READ_BATCH_EX pointer that invokes the given AHK function when called.
         * @param {Func(HREGREADBATCH, UInt32, HREGREADBATCHREPLY) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGREADBATCH, UInt32, HREGREADBATCHREPLY.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
