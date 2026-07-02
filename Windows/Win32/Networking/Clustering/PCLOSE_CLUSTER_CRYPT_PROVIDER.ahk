#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSCRYPTPROVIDER.ahk" { HCLUSCRYPTPROVIDER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLOSE_CLUSTER_CRYPT_PROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is PCLOSE_CLUSTER_CRYPT_PROVIDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSCRYPTPROVIDER} _hClusCryptProvider 
     * @returns {Integer} 
     */
    Call(_hClusCryptProvider) {
        result := DllCall(this.value, HCLUSCRYPTPROVIDER, _hClusCryptProvider, UInt32)
        return result
    }

    /**
     * A PCLOSE_CLUSTER_CRYPT_PROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLOSE_CLUSTER_CRYPT_PROVIDER {
        /**
         * Creates a PCLOSE_CLUSTER_CRYPT_PROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSCRYPTPROVIDER) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSCRYPTPROVIDER, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
