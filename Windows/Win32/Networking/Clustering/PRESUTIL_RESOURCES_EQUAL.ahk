#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_RESOURCES_EQUAL {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_RESOURCES_EQUAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} hSelf 
     * @param {HRESOURCE} _hResource 
     * @returns {BOOL} 
     */
    Call(hSelf, _hResource) {
        result := DllCall(this.value, HRESOURCE, hSelf, HRESOURCE, _hResource, BOOL)
        return result
    }

    /**
     * A PRESUTIL_RESOURCES_EQUAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_RESOURCES_EQUAL {
        /**
         * Creates a PRESUTIL_RESOURCES_EQUAL pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HRESOURCE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HRESOURCE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
