#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE) {
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
     * @param {PWSTR} lpszResourceTypeName 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszResourceTypeName) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceTypeName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE {
        /**
         * Creates a PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
