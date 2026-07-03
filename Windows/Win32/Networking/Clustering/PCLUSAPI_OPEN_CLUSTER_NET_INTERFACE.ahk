#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNETINTERFACE.ahk" { HNETINTERFACE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE) {
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
     * @param {PWSTR} lpszInterfaceName 
     * @returns {HNETINTERFACE} 
     */
    Call(_hCluster, lpszInterfaceName) {
        lpszInterfaceName := lpszInterfaceName is String ? StrPtr(lpszInterfaceName) : lpszInterfaceName

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszInterfaceName, HNETINTERFACE)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE {
        /**
         * Creates a PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR) => HNETINTERFACE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, HNETINTERFACE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
