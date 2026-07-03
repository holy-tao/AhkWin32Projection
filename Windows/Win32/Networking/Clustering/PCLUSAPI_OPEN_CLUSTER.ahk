#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszClusterName 
     * @returns {HCLUSTER} 
     */
    Call(lpszClusterName) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        result := DllCall(this.value, "ptr", lpszClusterName, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HCLUSTER])
        }

        __Delete() => CallbackFree(this.value)
    }
}
