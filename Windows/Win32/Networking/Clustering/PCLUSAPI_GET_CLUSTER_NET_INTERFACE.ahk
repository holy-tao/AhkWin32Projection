#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NET_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NET_INTERFACE) {
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
     * @param {PWSTR} lpszNetworkName 
     * @param {PWSTR} lpszInterfaceName 
     * @param {Pointer<Integer>} lpcchInterfaceName 
     * @returns {Integer} 
     */
    Call(_hCluster, lpszNodeName, lpszNetworkName, lpszInterfaceName, lpcchInterfaceName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName
        lpszInterfaceName := lpszInterfaceName is String ? StrPtr(lpszInterfaceName) : lpszInterfaceName

        lpcchInterfaceNameMarshal := lpcchInterfaceName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNodeName, "ptr", lpszNetworkName, "ptr", lpszInterfaceName, lpcchInterfaceNameMarshal, lpcchInterfaceName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NET_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NET_INTERFACE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NET_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, PWSTR, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, PWSTR, PWSTR, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
