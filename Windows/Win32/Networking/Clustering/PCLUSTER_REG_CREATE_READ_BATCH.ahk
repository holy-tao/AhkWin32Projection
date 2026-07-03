#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGREADBATCH.ahk" { HREGREADBATCH }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CREATE_READ_BATCH {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CREATE_READ_BATCH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} _hKey 
     * @param {Pointer<HREGREADBATCH>} phRegReadBatch 
     * @returns {Integer} 
     */
    Call(_hKey, phRegReadBatch) {
        phRegReadBatchMarshal := phRegReadBatch is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, phRegReadBatchMarshal, phRegReadBatch, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CREATE_READ_BATCH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CREATE_READ_BATCH {
        /**
         * Creates a PCLUSTER_REG_CREATE_READ_BATCH pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, HREGREADBATCH) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, HREGREADBATCH.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
