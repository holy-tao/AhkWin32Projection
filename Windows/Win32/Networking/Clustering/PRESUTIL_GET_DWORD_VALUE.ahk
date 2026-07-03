#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_DWORD_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_DWORD_VALUE) {
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
     * @param {Pointer<Integer>} pdwOutValue 
     * @param {Integer} dwDefaultValue 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszValueName, pdwOutValue, dwDefaultValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        pdwOutValueMarshal := pdwOutValue is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, pdwOutValueMarshal, pdwOutValue, UInt32, dwDefaultValue, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_DWORD_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_DWORD_VALUE {
        /**
         * Creates a PRESUTIL_GET_DWORD_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
