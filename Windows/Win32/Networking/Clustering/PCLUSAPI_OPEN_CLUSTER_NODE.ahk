#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_NODE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_NODE) {
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
     * @param {PWSTR} lpszNodeName 
     * @returns {HNODE} 
     */
    Call(_hCluster, lpszNodeName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNodeName, HNODE)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_NODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_NODE {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_NODE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => HNODE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HNODE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
