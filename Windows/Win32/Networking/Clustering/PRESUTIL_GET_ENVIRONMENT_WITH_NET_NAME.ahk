#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME) {
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
     * @returns {Pointer<Void>} 
     */
    Call(_hResource) {
        result := DllCall(this.value, HRESOURCE, _hResource, IntPtr)
        return result
    }

    /**
     * A PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME {
        /**
         * Creates a PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
