#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUPSET.ahk" { HGROUPSET }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUPSET} _hGroupSet 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hGroupSet, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HGROUPSET, _hGroupSet, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUPSET, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUPSET, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
