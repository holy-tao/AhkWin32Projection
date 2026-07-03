#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PDEVICE_NOTIFY_CALLBACK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PDEVICE_NOTIFY_CALLBACK_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} Type 
     * @param {Pointer<Void>} Setting 
     * @returns {Integer} 
     */
    Call(_Context, Type, Setting) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        SettingMarshal := Setting is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, Type, SettingMarshal, Setting, UInt32)
        return result
    }

    /**
     * A PDEVICE_NOTIFY_CALLBACK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEVICE_NOTIFY_CALLBACK_ROUTINE {
        /**
         * Creates a PDEVICE_NOTIFY_CALLBACK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
