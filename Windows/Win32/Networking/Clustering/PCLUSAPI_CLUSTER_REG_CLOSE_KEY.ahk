#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_CLOSE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_CLOSE_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} _hKey 
     * @returns {Integer} 
     */
    Call(_hKey) {
        result := DllCall(this.value, HKEY, _hKey, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_CLOSE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_CLOSE_KEY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_CLOSE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
