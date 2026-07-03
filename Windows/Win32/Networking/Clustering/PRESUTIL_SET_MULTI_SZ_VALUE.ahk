#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_MULTI_SZ_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_MULTI_SZ_VALUE) {
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
     * @param {Integer} pszNewValue 
     * @param {Integer} cbNewValueSize 
     * @param {Pointer<PWSTR>} ppszOutValue 
     * @param {Pointer<Integer>} pcbOutValueSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszValueName, pszNewValue, cbNewValueSize, ppszOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        ppszOutValueMarshal := ppszOutValue is VarRef ? "ptr*" : "ptr"
        pcbOutValueSizeMarshal := pcbOutValueSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, IntPtr, pszNewValue, UInt32, cbNewValueSize, ppszOutValueMarshal, ppszOutValue, pcbOutValueSizeMarshal, pcbOutValueSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_MULTI_SZ_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_MULTI_SZ_VALUE {
        /**
         * Creates a PRESUTIL_SET_MULTI_SZ_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, IntPtr, UInt32, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, IntPtr, UInt32, PWSTR.Ptr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
