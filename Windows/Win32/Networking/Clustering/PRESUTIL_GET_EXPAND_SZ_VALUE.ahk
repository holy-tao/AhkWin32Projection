#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_EXPAND_SZ_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_EXPAND_SZ_VALUE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} hkeyClusterKey 
     * @param {PWSTR} pszValueName 
     * @param {BOOL} bExpand 
     * @returns {PWSTR} 
     */
    Call(hkeyClusterKey, pszValueName, bExpand) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, BOOL, bExpand, PWSTR)
        return result
    }

    /**
     * A PRESUTIL_GET_EXPAND_SZ_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_EXPAND_SZ_VALUE {
        /**
         * Creates a PRESUTIL_GET_EXPAND_SZ_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, BOOL) => PWSTR} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, BOOL, PWSTR])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
