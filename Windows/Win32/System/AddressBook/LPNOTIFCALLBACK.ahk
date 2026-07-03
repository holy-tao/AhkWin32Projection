#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NOTIFICATION.ahk" { NOTIFICATION }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPNOTIFCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPNOTIFCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpvContext 
     * @param {Integer} cNotification 
     * @param {Pointer<NOTIFICATION>} lpNotifications 
     * @returns {Integer} 
     */
    Call(lpvContext, cNotification, lpNotifications) {
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, lpvContextMarshal, lpvContext, UInt32, cNotification, NOTIFICATION.Ptr, lpNotifications, Int32)
        return result
    }

    /**
     * A LPNOTIFCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNOTIFCALLBACK {
        /**
         * Creates a LPNOTIFCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, NOTIFICATION) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, NOTIFICATION.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
