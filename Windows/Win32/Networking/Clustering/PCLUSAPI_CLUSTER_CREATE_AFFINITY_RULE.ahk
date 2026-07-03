#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUS_AFFINITY_RULE_TYPE.ahk" { CLUS_AFFINITY_RULE_TYPE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE) {
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
     * @param {CLUS_AFFINITY_RULE_TYPE} ruleType 
     * @returns {Integer} 
     */
    Call(_hCluster, ruleName, ruleType) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", ruleName, CLUS_AFFINITY_RULE_TYPE, ruleType, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE {
        /**
         * Creates a PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, CLUS_AFFINITY_RULE_TYPE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, CLUS_AFFINITY_RULE_TYPE, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
