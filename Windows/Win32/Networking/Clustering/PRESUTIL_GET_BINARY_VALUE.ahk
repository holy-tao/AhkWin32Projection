#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_BINARY_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_BINARY_VALUE) {
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
     * @param {Pointer<Pointer<Integer>>} ppbOutValue 
     * @param {Pointer<Integer>} pcbOutValueSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszValueName, ppbOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        ppbOutValueMarshal := ppbOutValue is VarRef ? "ptr*" : "ptr"
        pcbOutValueSizeMarshal := pcbOutValueSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, ppbOutValueMarshal, ppbOutValue, pcbOutValueSizeMarshal, pcbOutValueSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_BINARY_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_BINARY_VALUE {
        /**
         * Creates a PRESUTIL_GET_BINARY_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, "ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
