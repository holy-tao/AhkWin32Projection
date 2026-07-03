#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX) {
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
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hKey, lpszSubKey, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, lpszReason) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, "ptr", lpszSubKey, UInt32, dwOptions, UInt32, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, "ptr", lpszReason, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, PWSTR, UInt32, UInt32, SECURITY_ATTRIBUTES, HKEY, "uint*", PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, PWSTR, UInt32, UInt32, SECURITY_ATTRIBUTES.Ptr, HKEY.Ptr, "uint*", PWSTR, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
