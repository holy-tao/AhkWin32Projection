#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX) {
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
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszResourceTypeName, lpszDisplayName, lpszResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval, lpszReason) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName
        lpszResourceTypeDll := lpszResourceTypeDll is String ? StrPtr(lpszResourceTypeDll) : lpszResourceTypeDll
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceTypeName, "ptr", lpszDisplayName, "ptr", lpszResourceTypeDll, UInt32, dwLooksAlivePollInterval, UInt32, dwIsAlivePollInterval, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, PWSTR, PWSTR, UInt32, UInt32, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, PWSTR, PWSTR, UInt32, UInt32, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
