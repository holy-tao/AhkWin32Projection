#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESTYPEENUM.ahk" { HRESTYPEENUM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESTYPEENUM} _hResTypeEnum 
     * @returns {Integer} 
     */
    Call(_hResTypeEnum) {
        result := DllCall(this.value, HRESTYPEENUM, _hResTypeEnum, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT pointer that invokes the given AHK function when called.
         * @param {Func(HRESTYPEENUM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESTYPEENUM, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
