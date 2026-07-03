#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HREGBATCH.ahk" { HREGBATCH }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CLOSE_BATCH {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CLOSE_BATCH) {
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
     * @param {BOOL} bCommit 
     * @param {Pointer<Integer>} failedCommandNumber 
     * @returns {Integer} 
     */
    Call(_hRegBatch, bCommit, failedCommandNumber) {
        failedCommandNumberMarshal := failedCommandNumber is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, HREGBATCH, _hRegBatch, BOOL, bCommit, failedCommandNumberMarshal, failedCommandNumber, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CLOSE_BATCH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CLOSE_BATCH {
        /**
         * Creates a PCLUSTER_REG_CLOSE_BATCH pointer that invokes the given AHK function when called.
         * @param {Func(HREGBATCH, BOOL, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGBATCH, BOOL, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
