#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPFORWARD_ROW2.ahk" { MIB_IPFORWARD_ROW2 }
#Import ".\MIB_NOTIFICATION_TYPE.ahk" { MIB_NOTIFICATION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PIPFORWARD_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PIPFORWARD_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallerContext 
     * @param {Pointer<MIB_IPFORWARD_ROW2>} Row 
     * @param {MIB_NOTIFICATION_TYPE} NotificationType 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext, Row, NotificationType) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext, MIB_IPFORWARD_ROW2.Ptr, Row, MIB_NOTIFICATION_TYPE, NotificationType)
    }

    /**
     * A PIPFORWARD_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIPFORWARD_CHANGE_CALLBACK {
        /**
         * Creates a PIPFORWARD_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MIB_IPFORWARD_ROW2, MIB_NOTIFICATION_TYPE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MIB_IPFORWARD_ROW2.Ptr, MIB_NOTIFICATION_TYPE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
