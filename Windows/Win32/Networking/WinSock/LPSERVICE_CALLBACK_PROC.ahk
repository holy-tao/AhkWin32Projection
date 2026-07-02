#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPSERVICE_CALLBACK_PROC {
    value : IntPtr

    __value {
        set {
            if (value is LPSERVICE_CALLBACK_PROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} _lParam 
     * @param {HANDLE} hAsyncTaskHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_lParam, hAsyncTaskHandle) {
        DllCall(this.value, LPARAM, _lParam, HANDLE, hAsyncTaskHandle)
    }

    /**
     * A LPSERVICE_CALLBACK_PROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPSERVICE_CALLBACK_PROC {
        /**
         * Creates a LPSERVICE_CALLBACK_PROC pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, HANDLE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
