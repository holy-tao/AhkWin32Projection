#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_DELETE_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_DELETE_VALUE) {
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
     * @param {PWSTR} lpszValueName 
     * @returns {Integer} 
     */
    Call(_hKey, lpszValueName) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszValueName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_DELETE_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_DELETE_VALUE {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_DELETE_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
