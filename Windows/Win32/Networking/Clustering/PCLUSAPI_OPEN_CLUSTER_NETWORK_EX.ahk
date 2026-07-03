#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_NETWORK_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_NETWORK_EX) {
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
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<Integer>} lpdwGrantedAccess 
     * @returns {HNETWORK} 
     */
    Call(_hCluster, lpszNetworkName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName

        lpdwGrantedAccessMarshal := lpdwGrantedAccess is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNetworkName, UInt32, dwDesiredAccess, lpdwGrantedAccessMarshal, lpdwGrantedAccess, HNETWORK)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_NETWORK_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_NETWORK_EX {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_NETWORK_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, UInt32, "uint*") => HNETWORK} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32, "uint*", HNETWORK])
        }

        __Delete() => CallbackFree(this.value)
    }
}
