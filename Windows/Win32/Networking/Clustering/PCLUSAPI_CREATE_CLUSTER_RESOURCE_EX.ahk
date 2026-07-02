#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import ".\HGROUP.ahk" { HGROUP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX) {
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
     * @param {PWSTR} lpszReason 
     * @returns {HRESOURCE} 
     */
    Call(_hGroup, lpszResourceName, lpszResourceType, dwFlags, lpszReason) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HGROUP, _hGroup, "ptr", lpszResourceName, "ptr", lpszResourceType, UInt32, dwFlags, "ptr", lpszReason, HRESOURCE)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, PWSTR, PWSTR, UInt32, PWSTR) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, PWSTR, PWSTR, UInt32, PWSTR, HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
