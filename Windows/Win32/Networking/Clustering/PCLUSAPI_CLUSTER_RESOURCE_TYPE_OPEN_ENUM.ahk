#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESTYPEENUM.ahk" { HRESTYPEENUM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM) {
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
     * @param {Integer} dwType 
     * @returns {HRESTYPEENUM} 
     */
    Call(_hCluster, lpszResourceTypeName, dwType) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszResourceTypeName, UInt32, dwType, HRESTYPEENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, UInt32) => HRESTYPEENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32, HRESTYPEENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
