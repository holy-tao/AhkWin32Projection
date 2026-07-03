#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_SET_BINARY_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_SET_BINARY_VALUE) {
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
     * @param {Integer} pbNewValue 
     * @param {Integer} cbNewValueSize 
     * @param {Integer} ppbOutValue 
     * @param {Pointer<Integer>} pcbOutValueSize 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pszValueName, pbNewValue, cbNewValueSize, ppbOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        pcbOutValueSizeMarshal := pcbOutValueSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, "ptr", pszValueName, IntPtr, pbNewValue, UInt32, cbNewValueSize, IntPtr, ppbOutValue, pcbOutValueSizeMarshal, pcbOutValueSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_SET_BINARY_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_SET_BINARY_VALUE {
        /**
         * Creates a PRESUTIL_SET_BINARY_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, IntPtr, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, IntPtr, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
