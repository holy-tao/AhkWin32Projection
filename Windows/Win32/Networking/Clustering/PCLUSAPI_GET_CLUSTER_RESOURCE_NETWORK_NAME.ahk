#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME) {
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
     * @param {PWSTR} lpBuffer 
     * @param {Pointer<Integer>} nSize 
     * @returns {BOOL} 
     */
    Call(_hResource, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        nSizeMarshal := nSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", lpBuffer, nSizeMarshal, nSize, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
