#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Shell\HELPINFO.ahk" { HELPINFO }

/**
 * A callback function, which you define in your application, that processes help events for the message box.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-msgboxcallback
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MSGBOXCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is MSGBOXCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<HELPINFO>} lpHelpInfo Type: **[LPHELPINFO](/windows/win32/api/winuser/ns-winuser-helpinfo)**
     * 
     * Information about the item for which context-sensitive help has been requested.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpHelpInfo) {
        DllCall(this.value, HELPINFO.Ptr, lpHelpInfo)
    }

    /**
     * A MSGBOXCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MSGBOXCALLBACK {
        /**
         * Creates a MSGBOXCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HELPINFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HELPINFO.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
