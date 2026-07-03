#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_BACKUP_CLUSTER_DATABASE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_BACKUP_CLUSTER_DATABASE) {
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
     * @param {PWSTR} lpszPathName 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszPathName) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszPathName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_BACKUP_CLUSTER_DATABASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_BACKUP_CLUSTER_DATABASE {
        /**
         * Creates a PCLUSAPI_BACKUP_CLUSTER_DATABASE pointer that invokes the given AHK function when called.
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
