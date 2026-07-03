#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPSET} hDependentGroupSet 
     * @param {PWSTR} lpRemoteClusterName 
     * @param {PWSTR} lpRemoteGroupSetName 
     * @returns {Integer} 
     */
    Call(hDependentGroupSet, lpRemoteClusterName, lpRemoteGroupSetName) {
        lpRemoteClusterName := lpRemoteClusterName is String ? StrPtr(lpRemoteClusterName) : lpRemoteClusterName
        lpRemoteGroupSetName := lpRemoteGroupSetName is String ? StrPtr(lpRemoteGroupSetName) : lpRemoteGroupSetName

        result := DllCall(this.value, HGROUPSET, hDependentGroupSet, "ptr", lpRemoteClusterName, "ptr", lpRemoteGroupSetName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY {
        /**
         * Creates a PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPSET, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPSET, PWSTR, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
