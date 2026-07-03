#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_AVAILABILITY_SET_CONFIG.ahk" { CLUSTER_AVAILABILITY_SET_CONFIG }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {PWSTR} lpAvailabilitySetName 
     * @param {Pointer<CLUSTER_AVAILABILITY_SET_CONFIG>} pAvailabilitySetConfig 
     * @returns {HGROUPSET} 
     */
    Call(_hCluster, lpAvailabilitySetName, pAvailabilitySetConfig) {
        lpAvailabilitySetName := lpAvailabilitySetName is String ? StrPtr(lpAvailabilitySetName) : lpAvailabilitySetName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpAvailabilitySetName, CLUSTER_AVAILABILITY_SET_CONFIG.Ptr, pAvailabilitySetConfig, HGROUPSET)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, CLUSTER_AVAILABILITY_SET_CONFIG) => HGROUPSET} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, CLUSTER_AVAILABILITY_SET_CONFIG.Ptr, HGROUPSET])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
