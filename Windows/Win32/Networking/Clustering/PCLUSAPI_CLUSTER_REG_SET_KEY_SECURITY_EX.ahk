#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX) {
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
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hKey, SecurityInformation, pSecurityDescriptor, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HKEY, _hKey, UInt32, SecurityInformation, PSECURITY_DESCRIPTOR, pSecurityDescriptor, "ptr", lpszReason, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, UInt32, PSECURITY_DESCRIPTOR, PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, UInt32, PSECURITY_DESCRIPTOR, PWSTR, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
