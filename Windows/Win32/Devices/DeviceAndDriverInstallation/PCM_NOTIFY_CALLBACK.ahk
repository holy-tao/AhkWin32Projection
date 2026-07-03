#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_NOTIFY_ACTION.ahk" { CM_NOTIFY_ACTION }
#Import ".\HCMNOTIFICATION.ahk" { HCMNOTIFICATION }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct PCM_NOTIFY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCM_NOTIFY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCMNOTIFICATION} hNotify 
     * @param {Pointer<Void>} _Context 
     * @param {CM_NOTIFY_ACTION} Action 
     * @param {Integer} EventData 
     * @param {Integer} EventDataSize 
     * @returns {Integer} 
     */
    Call(hNotify, _Context, Action, EventData, EventDataSize) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCMNOTIFICATION, hNotify, _ContextMarshal, _Context, CM_NOTIFY_ACTION, Action, IntPtr, EventData, UInt32, EventDataSize, UInt32)
        return result
    }

    /**
     * A PCM_NOTIFY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCM_NOTIFY_CALLBACK {
        /**
         * Creates a PCM_NOTIFY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HCMNOTIFICATION, "ptr", CM_NOTIFY_ACTION, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCMNOTIFICATION, "ptr", CM_NOTIFY_ACTION, IntPtr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
