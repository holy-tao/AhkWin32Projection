#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * HCN_NOTIFICATION_CALLBACK
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_NOTIFICATION_CALLBACK
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
export default struct HCN_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is HCN_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} NotificationType The type of notification [`HCN_NOTIFICATIONS`](./HCN_NOTIFICATIONS.md).
     * @param {Pointer<Void>} _Context Handle for context of callback.
     * @param {HRESULT} NotificationStatus Notification Status.
     * @param {PWSTR} NotificationData Data associated with the notification.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(NotificationType, _Context, NotificationStatus, NotificationData) {
        NotificationData := NotificationData is String ? StrPtr(NotificationData) : NotificationData

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, NotificationType, _ContextMarshal, _Context, "int", NotificationStatus, "ptr", NotificationData)
    }

    /**
     * A HCN_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HCN_NOTIFICATION_CALLBACK {
        /**
         * Creates a HCN_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
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
