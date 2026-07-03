#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NET_EVENT3.ahk" { FWPM_NET_EVENT3 }

/**
 * Is used to add custom behavior to the net event subscription process. (FWPM_NET_EVENT_CALLBACK2)
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventsubscribe2">FwpmNetEventSubscribe2</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-fwpm_net_event_callback2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CALLBACK2 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_NET_EVENT_CALLBACK2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventsubscribe2">FwpmNetEventSubscribe2</a> function.
     * @param {Pointer<FWPM_NET_EVENT3>} event An [FWPM_NET_EVENT3](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event3) struct that contains the event information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, event) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_NET_EVENT3.Ptr, event)
    }

    /**
     * A FWPM_NET_EVENT_CALLBACK2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_NET_EVENT_CALLBACK2 {
        /**
         * Creates a FWPM_NET_EVENT_CALLBACK2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_NET_EVENT3) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_NET_EVENT3.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
