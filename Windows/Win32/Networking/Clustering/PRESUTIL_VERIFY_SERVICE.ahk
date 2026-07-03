#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Services\SC_HANDLE.ahk" { SC_HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_VERIFY_SERVICE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_VERIFY_SERVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {Integer} 
     */
    Call(hServiceHandle) {
        result := DllCall(this.value, SC_HANDLE, hServiceHandle, UInt32)
        return result
    }

    /**
     * A PRESUTIL_VERIFY_SERVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_VERIFY_SERVICE {
        /**
         * Creates a PRESUTIL_VERIFY_SERVICE pointer that invokes the given AHK function when called.
         * @param {Func(SC_HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SC_HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
