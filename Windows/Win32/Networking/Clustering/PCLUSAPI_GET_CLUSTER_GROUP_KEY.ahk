#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_GROUP_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_GROUP_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {Integer} samDesired 
     * @returns {HKEY} 
     */
    Call(_hGroup, samDesired) {
        result := DllCall(this.value, HGROUP, _hGroup, UInt32, samDesired, HKEY.Owned)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_GROUP_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_GROUP_KEY {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_GROUP_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, UInt32) => HKEY} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, UInt32, HKEY])
        }

        __Delete() => CallbackFree(this.value)
    }
}
