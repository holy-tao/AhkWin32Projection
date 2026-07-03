#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE) {
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
     * @param {PWSTR} lpszDisplayName 
     * @param {PWSTR} lpszResourceTypeDll 
     * @param {Integer} dwLooksAlivePollInterval 
     * @param {Integer} dwIsAlivePollInterval 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszResourceTypeName, lpszDisplayName, lpszResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName
        lpszResourceTypeDll := lpszResourceTypeDll is String ? StrPtr(lpszResourceTypeDll) : lpszResourceTypeDll

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceTypeName, "ptr", lpszDisplayName, "ptr", lpszResourceTypeDll, UInt32, dwLooksAlivePollInterval, UInt32, dwIsAlivePollInterval, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, PWSTR, PWSTR, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, PWSTR, PWSTR, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
