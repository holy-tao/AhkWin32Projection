#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_SERVICE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_SERVICE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Integer} DeviceId 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @param {Pointer} Param3 
     * @returns {BOOL} 
     */
    Call(FaxHandle, DeviceId, Param1, Param2, Param3) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, DeviceId, IntPtr, Param1, IntPtr, Param2, IntPtr, Param3, BOOL)
        return result
    }

    /**
     * A PFAX_SERVICE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_SERVICE_CALLBACK {
        /**
         * Creates a PFAX_SERVICE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, IntPtr, IntPtr, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr, IntPtr, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
