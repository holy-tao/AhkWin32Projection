#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_CREATE_GROUP_INFO.ahk" { CLUSTER_CREATE_GROUP_INFO }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_GROUPEX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_GROUPEX) {
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
     * @param {Pointer<CLUSTER_CREATE_GROUP_INFO>} pGroupInfo 
     * @returns {HGROUP} 
     */
    Call(_hCluster, lpszGroupName, pGroupInfo) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszGroupName, CLUSTER_CREATE_GROUP_INFO.Ptr, pGroupInfo, HGROUP)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_GROUPEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_GROUPEX {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_GROUPEX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, CLUSTER_CREATE_GROUP_INFO) => HGROUP} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, CLUSTER_CREATE_GROUP_INFO.Ptr, HGROUP])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
