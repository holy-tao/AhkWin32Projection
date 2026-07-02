#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PNETISO_EDP_ID_CALLBACK_FN {
    value : IntPtr

    __value {
        set {
            if (value is PNETISO_EDP_ID_CALLBACK_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @param {PWSTR} wszEnterpriseId 
     * @param {Integer} dwErr 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, wszEnterpriseId, dwErr) {
        wszEnterpriseId := wszEnterpriseId is String ? StrPtr(wszEnterpriseId) : wszEnterpriseId

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", wszEnterpriseId, UInt32, dwErr)
    }

    /**
     * A PNETISO_EDP_ID_CALLBACK_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNETISO_EDP_ID_CALLBACK_FN {
        /**
         * Creates a PNETISO_EDP_ID_CALLBACK_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
