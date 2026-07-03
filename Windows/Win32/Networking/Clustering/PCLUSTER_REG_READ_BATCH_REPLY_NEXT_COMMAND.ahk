#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_READ_BATCH_COMMAND.ahk" { CLUSTER_READ_BATCH_COMMAND }
#Import ".\HREGREADBATCHREPLY.ahk" { HREGREADBATCHREPLY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND) {
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
     * @param {Pointer<CLUSTER_READ_BATCH_COMMAND>} pBatchCommand 
     * @returns {Integer} 
     */
    Call(_hRegReadBatchReply, pBatchCommand) {
        result := DllCall(this.value, HREGREADBATCHREPLY, _hRegReadBatchReply, CLUSTER_READ_BATCH_COMMAND.Ptr, pBatchCommand, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND {
        /**
         * Creates a PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND pointer that invokes the given AHK function when called.
         * @param {Func(HREGREADBATCHREPLY, CLUSTER_READ_BATCH_COMMAND) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGREADBATCHREPLY, CLUSTER_READ_BATCH_COMMAND.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
