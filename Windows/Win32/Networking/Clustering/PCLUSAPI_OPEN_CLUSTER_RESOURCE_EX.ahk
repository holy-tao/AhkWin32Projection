#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX) {
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
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<Integer>} lpdwGrantedAccess 
     * @returns {HRESOURCE} 
     */
    Call(_hCluster, lpszResourceName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        lpdwGrantedAccessMarshal := lpdwGrantedAccess is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceName, UInt32, dwDesiredAccess, lpdwGrantedAccessMarshal, lpdwGrantedAccess, HRESOURCE)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, UInt32, "uint*") => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32, "uint*", HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
