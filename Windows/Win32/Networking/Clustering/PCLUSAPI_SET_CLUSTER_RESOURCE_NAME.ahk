#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_RESOURCE_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_RESOURCE_NAME) {
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
     * @param {PWSTR} lpszResourceName 
     * @returns {Integer} 
     */
    Call(_hResource, lpszResourceName) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", lpszResourceName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_RESOURCE_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_RESOURCE_NAME {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_RESOURCE_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
