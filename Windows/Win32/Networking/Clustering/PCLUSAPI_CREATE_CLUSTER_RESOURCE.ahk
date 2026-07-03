#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_RESOURCE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_RESOURCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {PWSTR} lpszResourceName 
     * @param {PWSTR} lpszResourceType 
     * @param {Integer} dwFlags 
     * @returns {HRESOURCE} 
     */
    Call(_hGroup, lpszResourceName, lpszResourceType, dwFlags) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        result := DllCall(this.value, HGROUP, _hGroup, "ptr", lpszResourceName, "ptr", lpszResourceType, UInt32, dwFlags, HRESOURCE)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_RESOURCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_RESOURCE {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_RESOURCE pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, PWSTR, PWSTR, UInt32) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, PWSTR, PWSTR, UInt32, HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
