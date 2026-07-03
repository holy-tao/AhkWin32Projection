#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSCRYPTPROVIDER.ahk" { HCLUSCRYPTPROVIDER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POPEN_CLUSTER_CRYPT_PROVIDEREX {
    value : IntPtr

    __value {
        set {
            if (value is POPEN_CLUSTER_CRYPT_PROVIDEREX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszResource 
     * @param {PWSTR} lpszKeyname 
     * @param {Pointer<Integer>} lpszProvider 
     * @param {Integer} dwType 
     * @param {Integer} dwFlags 
     * @returns {HCLUSCRYPTPROVIDER} 
     */
    Call(lpszResource, lpszKeyname, lpszProvider, dwType, dwFlags) {
        lpszResource := lpszResource is String ? StrPtr(lpszResource) : lpszResource
        lpszKeyname := lpszKeyname is String ? StrPtr(lpszKeyname) : lpszKeyname

        lpszProviderMarshal := lpszProvider is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", lpszResource, "ptr", lpszKeyname, lpszProviderMarshal, lpszProvider, UInt32, dwType, UInt32, dwFlags, HCLUSCRYPTPROVIDER)
        return result
    }

    /**
     * A POPEN_CLUSTER_CRYPT_PROVIDEREX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPEN_CLUSTER_CRYPT_PROVIDEREX {
        /**
         * Creates a POPEN_CLUSTER_CRYPT_PROVIDEREX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "char*", UInt32, UInt32) => HCLUSCRYPTPROVIDER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "char*", UInt32, UInt32, HCLUSCRYPTPROVIDER])
        }

        __Delete() => CallbackFree(this.value)
    }
}
