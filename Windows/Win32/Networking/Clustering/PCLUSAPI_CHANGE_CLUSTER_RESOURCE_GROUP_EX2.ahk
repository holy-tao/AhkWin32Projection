#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2) {
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
     * @param {HGROUP} _hGroup 
     * @param {Integer} Flags 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hResource, _hGroup, Flags, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HRESOURCE, _hResource, HGROUP, _hGroup, Int64, Flags, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 {
        /**
         * Creates a PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, HGROUP, Int64, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, HGROUP, Int64, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
