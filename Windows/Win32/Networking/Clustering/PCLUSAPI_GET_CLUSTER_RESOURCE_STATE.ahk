#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_RESOURCE_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_RESOURCE_STATE) {
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
     * @param {PWSTR} lpszNodeName 
     * @param {Pointer<Integer>} lpcchNodeName 
     * @param {PWSTR} lpszGroupName 
     * @param {Pointer<Integer>} lpcchGroupName 
     * @returns {CLUSTER_RESOURCE_STATE} 
     */
    Call(_hResource, lpszNodeName, lpcchNodeName, lpszGroupName, lpcchGroupName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        lpcchNodeNameMarshal := lpcchNodeName is VarRef ? "uint*" : "ptr"
        lpcchGroupNameMarshal := lpcchGroupName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", lpszNodeName, lpcchNodeNameMarshal, lpcchNodeName, "ptr", lpszGroupName, lpcchGroupNameMarshal, lpcchGroupName, CLUSTER_RESOURCE_STATE)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_RESOURCE_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_RESOURCE_STATE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_RESOURCE_STATE pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, "uint*", PWSTR, "uint*") => CLUSTER_RESOURCE_STATE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, "uint*", PWSTR, "uint*", CLUSTER_RESOURCE_STATE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
