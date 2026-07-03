#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX) {
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
     * @param {PWSTR} lpszTypeName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszTypeName, lpszReason) {
        lpszTypeName := lpszTypeName is String ? StrPtr(lpszTypeName) : lpszTypeName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszTypeName, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX {
        /**
         * Creates a PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
