#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HRESENUMEX.ahk" { HRESENUMEX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX) {
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
     * @param {Integer} lpszProperties 
     * @param {Integer} cbProperties 
     * @param {Integer} lpszRoProperties 
     * @param {Integer} cbRoProperties 
     * @param {Integer} dwFlags 
     * @returns {HRESENUMEX} 
     */
    Call(_hCluster, lpszProperties, cbProperties, lpszRoProperties, cbRoProperties, dwFlags) {
        result := DllCall(this.value, HCLUSTER, _hCluster, IntPtr, lpszProperties, UInt32, cbProperties, IntPtr, lpszRoProperties, UInt32, cbRoProperties, UInt32, dwFlags, HRESENUMEX)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, IntPtr, UInt32, IntPtr, UInt32, UInt32) => HRESENUMEX} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, IntPtr, UInt32, IntPtr, UInt32, UInt32, HRESENUMEX])
        }

        __Delete() => CallbackFree(this.value)
    }
}
