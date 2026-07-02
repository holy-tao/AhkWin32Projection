#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszClusterName 
     * @param {PWSTR} lpszNewPassword 
     * @param {Integer} dwFlags 
     * @param {Integer} lpReturnStatusBuffer 
     * @param {Pointer<Integer>} lpcbReturnStatusBufferSize 
     * @returns {Integer} 
     */
    Call(lpszClusterName, lpszNewPassword, dwFlags, lpReturnStatusBuffer, lpcbReturnStatusBufferSize) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName
        lpszNewPassword := lpszNewPassword is String ? StrPtr(lpszNewPassword) : lpszNewPassword

        lpcbReturnStatusBufferSizeMarshal := lpcbReturnStatusBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpszClusterName, "ptr", lpszNewPassword, UInt32, dwFlags, IntPtr, lpReturnStatusBuffer, lpcbReturnStatusBufferSizeMarshal, lpcbReturnStatusBufferSize, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
