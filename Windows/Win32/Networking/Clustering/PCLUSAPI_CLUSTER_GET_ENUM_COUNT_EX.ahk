#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSENUMEX.ahk" { HCLUSENUMEX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSENUMEX} hClusterEnum 
     * @returns {Integer} 
     */
    Call(hClusterEnum) {
        result := DllCall(this.value, HCLUSENUMEX, hClusterEnum, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSENUMEX) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSENUMEX, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
