#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszClusterName 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<Integer>} lpdwGrantedAccess 
     * @returns {HCLUSTER} 
     */
    Call(lpszClusterName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        lpdwGrantedAccessMarshal := lpdwGrantedAccess is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpszClusterName, UInt32, dwDesiredAccess, lpdwGrantedAccessMarshal, lpdwGrantedAccess, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_EX {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_EX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "uint*") => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "uint*", HCLUSTER])
        }

        __Delete() => CallbackFree(this.value)
    }
}
