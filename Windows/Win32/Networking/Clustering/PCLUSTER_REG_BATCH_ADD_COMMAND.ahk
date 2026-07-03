#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_REG_COMMAND.ahk" { CLUSTER_REG_COMMAND }
#Import ".\HREGBATCH.ahk" { HREGBATCH }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_BATCH_ADD_COMMAND {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_BATCH_ADD_COMMAND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGBATCH} _hRegBatch 
     * @param {CLUSTER_REG_COMMAND} dwCommand 
     * @param {PWSTR} wzName 
     * @param {Integer} dwOptions 
     * @param {Integer} lpData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     */
    Call(_hRegBatch, dwCommand, wzName, dwOptions, lpData, cbData) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := DllCall(this.value, HREGBATCH, _hRegBatch, CLUSTER_REG_COMMAND, dwCommand, "ptr", wzName, UInt32, dwOptions, IntPtr, lpData, UInt32, cbData, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_BATCH_ADD_COMMAND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_BATCH_ADD_COMMAND {
        /**
         * Creates a PCLUSTER_REG_BATCH_ADD_COMMAND pointer that invokes the given AHK function when called.
         * @param {Func(HREGBATCH, CLUSTER_REG_COMMAND, PWSTR, UInt32, IntPtr, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGBATCH, CLUSTER_REG_COMMAND, PWSTR, UInt32, IntPtr, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
