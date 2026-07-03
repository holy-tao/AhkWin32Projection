#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RadiusExtensionTerm function is an application-defined function and is called by NPS prior to unloading the Extension DLL. Use RadiusExtensionTerm to perform any clean-up operations for the Extension DLL.
 * @remarks
 * **RadiusExtensionTerm** is an optional function. The RADIUS Extension DLL need not implement **RadiusExtensionTerm**.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_term
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_TERM {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_TERM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Call() {
        DllCall(this.value)
    }

    /**
     * A PRADIUS_EXTENSION_TERM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_TERM {
        /**
         * Creates a PRADIUS_EXTENSION_TERM pointer that invokes the given AHK function when called.
         * @param {Func() => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
