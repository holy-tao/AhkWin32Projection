#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGBATCH.ahk" { HREGBATCH }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_CREATE_BATCH {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_CREATE_BATCH) {
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
     * @param {Pointer<HREGBATCH>} pHREGBATCH 
     * @returns {Integer} 
     */
    Call(_hKey, pHREGBATCH) {
        pHREGBATCHMarshal := pHREGBATCH is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, pHREGBATCHMarshal, pHREGBATCH, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_CREATE_BATCH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_CREATE_BATCH {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_CREATE_BATCH pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, HREGBATCH) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, HREGBATCH.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
