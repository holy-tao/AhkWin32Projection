#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_DELETE_CLUSTER_GROUP_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_DELETE_CLUSTER_GROUP_EX) {
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
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HGROUP, _hGroup, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_DELETE_CLUSTER_GROUP_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_DELETE_CLUSTER_GROUP_EX {
        /**
         * Creates a PCLUSAPI_DELETE_CLUSTER_GROUP_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
