#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INET_FIREWALL_AC_CHANGE.ahk" { INET_FIREWALL_AC_CHANGE }

/**
 * The PAC_CHANGES_CALLBACK_FN callback function is used to add custom behavior to the app container change notification process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-networkisolationregisterforappcontainerchanges">NetworkIsolationRegisterForAppContainerChanges</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pac_changes_callback_fn
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PAC_CHANGES_CALLBACK_FN {
    value : IntPtr

    __value {
        set {
            if (value is PAC_CHANGES_CALLBACK_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context Type: <b>void*</b>
     * 
     * Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-networkisolationregisterforappcontainerchanges">NetworkIsolationRegisterForAppContainerChanges</a> function.
     * @param {Pointer<INET_FIREWALL_AC_CHANGE>} pChange Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/netfw/ns-netfw-inet_firewall_ac_change">INET_FIREWALL_AC_CHANGE</a>*</b>
     * 
     * The app container change information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, pChange) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, INET_FIREWALL_AC_CHANGE.Ptr, pChange)
    }

    /**
     * A PAC_CHANGES_CALLBACK_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PAC_CHANGES_CALLBACK_FN {
        /**
         * Creates a PAC_CHANGES_CALLBACK_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", INET_FIREWALL_AC_CHANGE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", INET_FIREWALL_AC_CHANGE.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
