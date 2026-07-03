#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_NOTIFICATION_TYPE.ahk" { MIB_NOTIFICATION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PTEREDO_PORT_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PTEREDO_PORT_CHANGE_CALLBACK) {
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
     * @param {Integer} Port 
     * @param {MIB_NOTIFICATION_TYPE} NotificationType 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext, Port, NotificationType) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext, UInt16, Port, MIB_NOTIFICATION_TYPE, NotificationType)
    }

    /**
     * A PTEREDO_PORT_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTEREDO_PORT_CHANGE_CALLBACK {
        /**
         * Creates a PTEREDO_PORT_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, MIB_NOTIFICATION_TYPE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, MIB_NOTIFICATION_TYPE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
