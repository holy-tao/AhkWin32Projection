#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUPENUMEX.ahk" { HGROUPENUMEX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPENUMEX} _hGroupEnumEx 
     * @returns {Integer} 
     */
    Call(_hGroupEnumEx) {
        result := DllCall(this.value, HGROUPENUMEX, _hGroupEnumEx, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPENUMEX) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPENUMEX, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
