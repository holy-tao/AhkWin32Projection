#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Services\SC_HANDLE.ahk" { SC_HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_START_RESOURCE_SERVICE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_START_RESOURCE_SERVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszServiceName 
     * @param {Pointer<SC_HANDLE>} phServiceHandle 
     * @returns {Integer} 
     */
    Call(pszServiceName, phServiceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall(this.value, "ptr", pszServiceName, SC_HANDLE.Ptr, phServiceHandle, UInt32)
        return result
    }

    /**
     * A PRESUTIL_START_RESOURCE_SERVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_START_RESOURCE_SERVICE {
        /**
         * Creates a PRESUTIL_START_RESOURCE_SERVICE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, SC_HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, SC_HANDLE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
