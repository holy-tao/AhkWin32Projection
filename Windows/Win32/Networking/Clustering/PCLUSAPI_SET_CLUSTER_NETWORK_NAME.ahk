#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_NETWORK_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_NETWORK_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNETWORK} _hNetwork 
     * @param {PWSTR} lpszName 
     * @returns {Integer} 
     */
    Call(_hNetwork, lpszName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall(this.value, HNETWORK, _hNetwork, "ptr", lpszName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_NETWORK_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_NETWORK_NAME {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_NETWORK_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
