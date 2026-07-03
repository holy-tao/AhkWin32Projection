#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESENUM.ahk" { HRESENUM }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} _hResource 
     * @param {Integer} dwType 
     * @returns {HRESENUM} 
     */
    Call(_hResource, dwType) {
        result := DllCall(this.value, HRESOURCE, _hResource, UInt32, dwType, HRESENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, UInt32) => HRESENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, UInt32, HRESENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
