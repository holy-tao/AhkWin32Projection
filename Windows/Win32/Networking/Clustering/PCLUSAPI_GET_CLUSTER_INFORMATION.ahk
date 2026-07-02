#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\CLUSTERVERSIONINFO.ahk" { CLUSTERVERSIONINFO }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_INFORMATION {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_INFORMATION) {
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
     * @param {PWSTR} lpszClusterName 
     * @param {Pointer<Integer>} lpcchClusterName 
     * @param {Pointer<CLUSTERVERSIONINFO>} lpClusterInfo 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszClusterName, lpcchClusterName, lpClusterInfo) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        lpcchClusterNameMarshal := lpcchClusterName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszClusterName, lpcchClusterNameMarshal, lpcchClusterName, CLUSTERVERSIONINFO.Ptr, lpClusterInfo, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_INFORMATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_INFORMATION {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_INFORMATION pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, "uint*", CLUSTERVERSIONINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, "uint*", CLUSTERVERSIONINFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
