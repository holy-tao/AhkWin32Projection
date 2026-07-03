#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_QUERY_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_QUERY_VALUE) {
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
     * @param {Pointer<Integer>} lpdwValueType 
     * @param {Integer} lpData 
     * @param {Pointer<Integer>} lpcbData 
     * @returns {Integer} 
     */
    Call(_hKey, lpszValueName, lpdwValueType, lpData, lpcbData) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName

        lpdwValueTypeMarshal := lpdwValueType is VarRef ? "uint*" : "ptr"
        lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszValueName, lpdwValueTypeMarshal, lpdwValueType, IntPtr, lpData, lpcbDataMarshal, lpcbData, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_QUERY_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_QUERY_VALUE {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_QUERY_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, "uint*", IntPtr, "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, "uint*", IntPtr, "uint*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
