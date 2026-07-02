#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCHANGE.ahk" { HCHANGE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCHANGE} _hChange 
     * @param {Pointer<Pointer>} lpdwNotifyKey 
     * @param {Pointer<Integer>} lpdwFilterType 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @param {Integer} dwMilliseconds 
     * @returns {Integer} 
     */
    Call(_hChange, lpdwNotifyKey, lpdwFilterType, lpszName, lpcchName, dwMilliseconds) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lpdwNotifyKeyMarshal := lpdwNotifyKey is VarRef ? "ptr*" : "ptr"
        lpdwFilterTypeMarshal := lpdwFilterType is VarRef ? "uint*" : "ptr"
        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCHANGE, _hChange, lpdwNotifyKeyMarshal, lpdwNotifyKey, lpdwFilterTypeMarshal, lpdwFilterType, "ptr", lpszName, lpcchNameMarshal, lpcchName, UInt32, dwMilliseconds, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NOTIFY {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, "ptr*", "uint*", PWSTR, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, "ptr*", "uint*", PWSTR, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
