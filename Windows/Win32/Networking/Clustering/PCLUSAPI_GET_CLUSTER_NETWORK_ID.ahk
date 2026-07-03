#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NETWORK_ID {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NETWORK_ID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNETWORK} _hNetwork 
     * @param {PWSTR} lpszNetworkId 
     * @param {Pointer<Integer>} lpcchName 
     * @returns {Integer} 
     */
    Call(_hNetwork, lpszNetworkId, lpcchName) {
        lpszNetworkId := lpszNetworkId is String ? StrPtr(lpszNetworkId) : lpszNetworkId

        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HNETWORK, _hNetwork, "ptr", lpszNetworkId, lpcchNameMarshal, lpcchName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NETWORK_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NETWORK_ID {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NETWORK_ID pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
