#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} _hKey 
     * @param {PWSTR} lpSubKey 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hKey, lpSubKey, lpszReason) {
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpSubKey, "ptr", lpszReason, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, PWSTR, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
