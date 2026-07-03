#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is HCS_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @param {Pointer<Void>} _context 
     * @param {HRESULT} notificationStatus 
     * @param {PWSTR} notificationData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(notificationType, _context, notificationStatus, notificationData) {
        notificationData := notificationData is String ? StrPtr(notificationData) : notificationData

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, notificationType, _contextMarshal, _context, "int", notificationStatus, "ptr", notificationData)
    }

    /**
     * A HCS_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HCS_NOTIFICATION_CALLBACK {
        /**
         * Creates a HCS_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", "int", PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", "int", PWSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
