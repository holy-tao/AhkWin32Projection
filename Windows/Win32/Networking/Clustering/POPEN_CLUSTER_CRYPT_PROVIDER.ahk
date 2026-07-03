#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSCRYPTPROVIDER.ahk" { HCLUSCRYPTPROVIDER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POPEN_CLUSTER_CRYPT_PROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is POPEN_CLUSTER_CRYPT_PROVIDER) {
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
     * @param {Pointer<Integer>} lpszProvider 
     * @param {Integer} dwType 
     * @param {Integer} dwFlags 
     * @returns {HCLUSCRYPTPROVIDER} 
     */
    Call(lpszResource, lpszProvider, dwType, dwFlags) {
        lpszResource := lpszResource is String ? StrPtr(lpszResource) : lpszResource

        lpszProviderMarshal := lpszProvider is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", lpszResource, lpszProviderMarshal, lpszProvider, UInt32, dwType, UInt32, dwFlags, HCLUSCRYPTPROVIDER)
        return result
    }

    /**
     * A POPEN_CLUSTER_CRYPT_PROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPEN_CLUSTER_CRYPT_PROVIDER {
        /**
         * Creates a POPEN_CLUSTER_CRYPT_PROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "char*", UInt32, UInt32) => HCLUSCRYPTPROVIDER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "char*", UInt32, UInt32, HCLUSCRYPTPROVIDER])
        }

        __Delete() => CallbackFree(this.value)
    }
}
