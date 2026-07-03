#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_NETWORK {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_NETWORK) {
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
     * @param {PWSTR} lpszNetworkName 
     * @returns {HNETWORK} 
     */
    Call(_hCluster, lpszNetworkName) {
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNetworkName, HNETWORK)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_NETWORK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_NETWORK {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_NETWORK pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => HNETWORK} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HNETWORK])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
