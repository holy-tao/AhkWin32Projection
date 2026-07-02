#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FileCallback callback function is used by a few setup functions. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/nc-setupapi-psp_file_callback_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 */
export default struct PSP_FILE_CALLBACK_A {
    value : IntPtr

    __value {
        set {
            if (value is PSP_FILE_CALLBACK_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context The context information about the queue notification  that is returned to the callback function.
     * @param {Integer} _Notification The event that triggers the call to the callback function.
     * @param {Pointer} Param1 The additional notification information. The value is dependent on the notification that is being returned.
     * @param {Pointer} Param2 The additional notification information. The value is dependent on the notification that is being returned.
     * @returns {Integer} 
     */
    Call(_Context, _Notification, Param1, Param2) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, _Notification, IntPtr, Param1, IntPtr, Param2, UInt32)
        return result
    }

    /**
     * A PSP_FILE_CALLBACK_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSP_FILE_CALLBACK_A {
        /**
         * Creates a PSP_FILE_CALLBACK_A pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, IntPtr, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
