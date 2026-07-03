#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT) {
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
     * @param {HRESOURCE} hResourceDependent 
     * @returns {BOOL} 
     */
    Call(_hResource, hResourceDependent) {
        result := DllCall(this.value, HRESOURCE, _hResource, HRESOURCE, hResourceDependent, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT {
        /**
         * Creates a PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HRESOURCE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HRESOURCE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
