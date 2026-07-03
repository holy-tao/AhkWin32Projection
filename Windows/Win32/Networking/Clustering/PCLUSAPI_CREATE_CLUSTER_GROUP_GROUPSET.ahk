#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET) {
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
     * @param {PWSTR} lpszGroupSetName 
     * @returns {HGROUPSET} 
     */
    Call(_hCluster, lpszGroupSetName) {
        lpszGroupSetName := lpszGroupSetName is String ? StrPtr(lpszGroupSetName) : lpszGroupSetName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszGroupSetName, HGROUPSET)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => HGROUPSET} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HGROUPSET])
        }

        __Delete() => CallbackFree(this.value)
    }
}
