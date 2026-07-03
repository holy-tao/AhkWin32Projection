#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct LPINTERNET_STATUS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPINTERNET_STATUS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet 
     * @param {Pointer} dwContext 
     * @param {Integer} dwInternetStatus 
     * @param {Pointer<Void>} lpvStatusInformation 
     * @param {Integer} dwStatusInformationLength 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hInternet, dwContext, dwInternetStatus, lpvStatusInformation, dwStatusInformationLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpvStatusInformationMarshal := lpvStatusInformation is VarRef ? "ptr" : "ptr"

        DllCall(this.value, hInternetMarshal, hInternet, IntPtr, dwContext, UInt32, dwInternetStatus, lpvStatusInformationMarshal, lpvStatusInformation, UInt32, dwStatusInformationLength)
    }

    /**
     * A LPINTERNET_STATUS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPINTERNET_STATUS_CALLBACK {
        /**
         * Creates a LPINTERNET_STATUS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "ptr", UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
