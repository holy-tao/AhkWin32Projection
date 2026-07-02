#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY) {
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
     * @param {Pointer<Integer>} lpcSubKeys 
     * @param {Pointer<Integer>} lpcbMaxSubKeyLen 
     * @param {Pointer<Integer>} lpcValues 
     * @param {Pointer<Integer>} lpcbMaxValueNameLen 
     * @param {Pointer<Integer>} lpcbMaxValueLen 
     * @param {Pointer<Integer>} lpcbSecurityDescriptor 
     * @param {Pointer<FILETIME>} lpftLastWriteTime 
     * @returns {Integer} 
     */
    Call(_hKey, lpcSubKeys, lpcbMaxSubKeyLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        lpcSubKeysMarshal := lpcSubKeys is VarRef ? "uint*" : "ptr"
        lpcbMaxSubKeyLenMarshal := lpcbMaxSubKeyLen is VarRef ? "uint*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lpcbMaxValueNameLenMarshal := lpcbMaxValueNameLen is VarRef ? "uint*" : "ptr"
        lpcbMaxValueLenMarshal := lpcbMaxValueLen is VarRef ? "uint*" : "ptr"
        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, lpcSubKeysMarshal, lpcSubKeys, lpcbMaxSubKeyLenMarshal, lpcbMaxSubKeyLen, lpcValuesMarshal, lpcValues, lpcbMaxValueNameLenMarshal, lpcbMaxValueNameLen, lpcbMaxValueLenMarshal, lpcbMaxValueLen, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, FILETIME.Ptr, lpftLastWriteTime, Int32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY {
        /**
         * Creates a PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, "uint*", "uint*", "uint*", "uint*", "uint*", "uint*", FILETIME) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, "uint*", "uint*", "uint*", "uint*", "uint*", "uint*", FILETIME.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
