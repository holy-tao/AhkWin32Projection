#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE) {
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
     * @param {PWSTR} ruleName 
     * @param {HGROUP} _hGroup 
     * @returns {Integer} 
     */
    Call(_hCluster, ruleName, _hGroup) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", ruleName, HGROUP, _hGroup, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE {
        /**
         * Creates a PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, HGROUP) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HGROUP, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
