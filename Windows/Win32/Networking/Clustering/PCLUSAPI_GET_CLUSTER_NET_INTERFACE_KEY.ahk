#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNETINTERFACE.ahk" { HNETINTERFACE }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNETINTERFACE} _hNetInterface 
     * @param {Integer} samDesired 
     * @returns {HKEY} 
     */
    Call(_hNetInterface, samDesired) {
        result := DllCall(this.value, HNETINTERFACE, _hNetInterface, UInt32, samDesired, HKEY.Owned)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HNETINTERFACE, UInt32) => HKEY} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETINTERFACE, UInt32, HKEY])
        }

        __Delete() => CallbackFree(this.value)
    }
}
