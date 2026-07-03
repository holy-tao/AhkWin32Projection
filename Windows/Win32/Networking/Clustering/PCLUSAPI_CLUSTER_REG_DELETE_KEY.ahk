#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_DELETE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_DELETE_KEY) {
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
     * @param {PWSTR} lpszSubKey 
     * @returns {Integer} 
     */
    Call(_hKey, lpszSubKey) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszSubKey, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_DELETE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_DELETE_KEY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_DELETE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
