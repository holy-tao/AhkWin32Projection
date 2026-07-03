#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_NAME_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_NAME_EX) {
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
     * @param {PWSTR} lpszNewClusterName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszNewClusterName, lpszReason) {
        lpszNewClusterName := lpszNewClusterName is String ? StrPtr(lpszNewClusterName) : lpszNewClusterName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNewClusterName, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_NAME_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_NAME_EX {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_NAME_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
