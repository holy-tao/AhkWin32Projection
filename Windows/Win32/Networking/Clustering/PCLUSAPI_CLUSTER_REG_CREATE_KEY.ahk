#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_CREATE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_CREATE_KEY) {
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
     * @param {PWSTR} lpszSubKey 
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @param {Pointer<HKEY>} phkResult 
     * @param {Pointer<Integer>} lpdwDisposition 
     * @returns {Integer} 
     */
    Call(_hKey, lpszSubKey, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey

        lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszSubKey, UInt32, dwOptions, UInt32, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_CREATE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_CREATE_KEY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_CREATE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, UInt32, UInt32, SECURITY_ATTRIBUTES, HKEY, "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, UInt32, UInt32, SECURITY_ATTRIBUTES.Ptr, HKEY.Ptr, "uint*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
