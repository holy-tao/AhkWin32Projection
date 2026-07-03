#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_SET_VALUE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_SET_VALUE_EX) {
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
     * @param {Integer} dwType 
     * @param {Pointer<Integer>} lpData 
     * @param {Integer} cbData 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hKey, lpszValueName, dwType, lpData, cbData, lpszReason) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        lpDataMarshal := lpData is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszValueName, UInt32, dwType, lpDataMarshal, lpData, UInt32, cbData, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_SET_VALUE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_SET_VALUE_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_SET_VALUE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, UInt32, "char*", UInt32, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, UInt32, "char*", UInt32, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
