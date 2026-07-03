#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_EXPAND_SZ_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_EXPAND_SZ_VALUE) {
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
     * @param {PWSTR} pszNewValue 
     * @param {Pointer<PWSTR>} ppszOutString 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszValueName, pszNewValue, ppszOutString) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszNewValue := pszNewValue is String ? StrPtr(pszNewValue) : pszNewValue

        ppszOutStringMarshal := ppszOutString is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, "ptr", pszNewValue, ppszOutStringMarshal, ppszOutString, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_EXPAND_SZ_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_EXPAND_SZ_VALUE {
        /**
         * Creates a PRESUTIL_SET_EXPAND_SZ_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, PWSTR, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, PWSTR, PWSTR.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
