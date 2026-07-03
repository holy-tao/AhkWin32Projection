#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPINTERFACE_ROW.ahk" { MIB_IPINTERFACE_ROW }
#Import ".\MIB_NOTIFICATION_TYPE.ahk" { MIB_NOTIFICATION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PIPINTERFACE_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PIPINTERFACE_CHANGE_CALLBACK) {
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
     * @param {Pointer<MIB_IPINTERFACE_ROW>} Row 
     * @param {MIB_NOTIFICATION_TYPE} NotificationType 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext, Row, NotificationType) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext, MIB_IPINTERFACE_ROW.Ptr, Row, MIB_NOTIFICATION_TYPE, NotificationType)
    }

    /**
     * A PIPINTERFACE_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIPINTERFACE_CHANGE_CALLBACK {
        /**
         * Creates a PIPINTERFACE_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MIB_IPINTERFACE_ROW, MIB_NOTIFICATION_TYPE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MIB_IPINTERFACE_ROW.Ptr, MIB_NOTIFICATION_TYPE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
