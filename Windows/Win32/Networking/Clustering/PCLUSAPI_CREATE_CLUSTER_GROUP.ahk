#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_GROUP) {
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
     * @param {PWSTR} lpszGroupName 
     * @returns {HGROUP} 
     */
    Call(_hCluster, lpszGroupName) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszGroupName, HGROUP)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_GROUP {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => HGROUP} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HGROUP])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
