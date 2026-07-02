#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_CONNECTION0.ahk" { FWPM_CONNECTION0 }
#Import ".\FWPM_CONNECTION_EVENT_TYPE.ahk" { FWPM_CONNECTION_EVENT_TYPE }

/**
 * Is used to add custom behavior to the connection object subscription process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectionsubscribe0">FwpmConnectionSubscribe0</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-fwpm_connection_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CONNECTION_CALLBACK0 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_CONNECTION_CALLBACK0) {
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
     * Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectionsubscribe0">FwpmConnectionSubscribe0</a> function.
     * @param {FWPM_CONNECTION_EVENT_TYPE} eventType Type: [FWPM_CONNECTION_EVENT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_connection_event_type)</b>
     * 
     * The type of connection object change event.
     * @param {Pointer<FWPM_CONNECTION0>} _connection Type: [FWPM_CONNECTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0)*</b>
     * 
     * The connection object change information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, eventType, _connection) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_CONNECTION_EVENT_TYPE, eventType, FWPM_CONNECTION0.Ptr, _connection)
    }

    /**
     * A FWPM_CONNECTION_CALLBACK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_CONNECTION_CALLBACK0 {
        /**
         * Creates a FWPM_CONNECTION_CALLBACK0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_CONNECTION_EVENT_TYPE, FWPM_CONNECTION0) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_CONNECTION_EVENT_TYPE, FWPM_CONNECTION0.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
