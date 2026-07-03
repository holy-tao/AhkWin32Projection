#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_ENUM_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_ENUM_VALUE) {
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
     * @param {Integer} dwIndex 
     * @param {PWSTR} lpszValueName 
     * @param {Pointer<Integer>} lpcchValueName 
     * @param {Pointer<Integer>} lpdwType 
     * @param {Integer} lpData 
     * @param {Pointer<Integer>} lpcbData 
     * @returns {Integer} 
     */
    Call(_hKey, dwIndex, lpszValueName, lpcchValueName, lpdwType, lpData, lpcbData) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName

        lpcchValueNameMarshal := lpcchValueName is VarRef ? "uint*" : "ptr"
        lpdwTypeMarshal := lpdwType is VarRef ? "uint*" : "ptr"
        lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, UInt32, dwIndex, "ptr", lpszValueName, lpcchValueNameMarshal, lpcchValueName, lpdwTypeMarshal, lpdwType, IntPtr, lpData, lpcbDataMarshal, lpcbData, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_ENUM_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_ENUM_VALUE {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_ENUM_VALUE pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, UInt32, PWSTR, "uint*", "uint*", IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, UInt32, PWSTR, "uint*", "uint*", IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
