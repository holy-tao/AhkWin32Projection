#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE) {
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
     * @param {PWSTR} lpszResourceName 
     * @param {Pointer<Integer>} lpcchResourceName 
     * @param {PWSTR} lpszDeviceName 
     * @param {Pointer<Integer>} lpcchDeviceName 
     * @param {Pointer<Integer>} lpdwMaxQuorumLogSize 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszResourceName, lpcchResourceName, lpszDeviceName, lpcchDeviceName, lpdwMaxQuorumLogSize) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        lpcchResourceNameMarshal := lpcchResourceName is VarRef ? "uint*" : "ptr"
        lpcchDeviceNameMarshal := lpcchDeviceName is VarRef ? "uint*" : "ptr"
        lpdwMaxQuorumLogSizeMarshal := lpdwMaxQuorumLogSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceName, lpcchResourceNameMarshal, lpcchResourceName, "ptr", lpszDeviceName, lpcchDeviceNameMarshal, lpcchDeviceName, lpdwMaxQuorumLogSizeMarshal, lpdwMaxQuorumLogSize, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, "uint*", PWSTR, "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, "uint*", PWSTR, "uint*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
