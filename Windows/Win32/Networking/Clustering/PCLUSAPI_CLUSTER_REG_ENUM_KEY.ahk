#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_ENUM_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_ENUM_KEY) {
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
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @param {Pointer<FILETIME>} lpftLastWriteTime 
     * @returns {Integer} 
     */
    Call(_hKey, dwIndex, lpszName, lpcchName, lpftLastWriteTime) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, UInt32, dwIndex, "ptr", lpszName, lpcchNameMarshal, lpcchName, FILETIME.Ptr, lpftLastWriteTime, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_ENUM_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_ENUM_KEY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_ENUM_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, UInt32, PWSTR, "uint*", FILETIME) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, UInt32, PWSTR, "uint*", FILETIME.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
