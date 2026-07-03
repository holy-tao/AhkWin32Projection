#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY) {
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
     * @param {Integer} RequestedInformation 
     * @param {Integer} pSecurityDescriptor 
     * @param {Pointer<Integer>} lpcbSecurityDescriptor 
     * @returns {Integer} 
     */
    Call(_hKey, RequestedInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, UInt32, RequestedInformation, IntPtr, pSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, UInt32, IntPtr, "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, UInt32, IntPtr, "uint*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
