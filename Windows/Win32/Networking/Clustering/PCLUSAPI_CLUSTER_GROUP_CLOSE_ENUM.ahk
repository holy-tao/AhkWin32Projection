#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUPENUM.ahk" { HGROUPENUM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPENUM} _hGroupEnum 
     * @returns {Integer} 
     */
    Call(_hGroupEnum) {
        result := DllCall(this.value, HGROUPENUM, _hGroupEnum, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPENUM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPENUM, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
