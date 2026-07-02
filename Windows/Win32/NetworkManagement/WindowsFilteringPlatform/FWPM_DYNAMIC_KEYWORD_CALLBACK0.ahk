#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A callback function, which you implement, that is invoked with notifications regarding changes to dynamic keyword address ([FW_DYNAMIC_KEYWORD_ADDRESS0](/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address0)) objects.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-fwpm_dynamic_keyword_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_DYNAMIC_KEYWORD_CALLBACK0 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_DYNAMIC_KEYWORD_CALLBACK0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _notification Type: \_In\_opt\_ **void\***
     * 
     * Not used.
     * @param {Pointer<Void>} _context Type: \_In\_opt\_ **void\***
     * 
     * The value you pass to [FwpmDynamicKeywordSubscribe0](nf-fwpmu-fwpmdynamickeywordsubscribe0.md) as the *context* argument.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_notification, _context) {
        _notificationMarshal := _notification is VarRef ? "ptr" : "ptr"
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _notificationMarshal, _notification, _contextMarshal, _context)
    }

    /**
     * A FWPM_DYNAMIC_KEYWORD_CALLBACK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_DYNAMIC_KEYWORD_CALLBACK0 {
        /**
         * Creates a FWPM_DYNAMIC_KEYWORD_CALLBACK0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
