#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HGROUPENUM.ahk" { HGROUPENUM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {Integer} dwType 
     * @returns {HGROUPENUM} 
     */
    Call(_hGroup, dwType) {
        result := DllCall(this.value, HGROUP, _hGroup, UInt32, dwType, HGROUPENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, UInt32) => HGROUPENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, UInt32, HGROUPENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
