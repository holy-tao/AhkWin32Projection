#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NET_EVENT2.ahk" { FWPM_NET_EVENT2 }

/**
 * Is used to add custom behavior to the net event subscription process. (FWPM_NET_EVENT_CALLBACK1)
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventsubscribe1">FwpmNetEventSubscribe1</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-fwpm_net_event_callback1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CALLBACK1 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_NET_EVENT_CALLBACK1) {
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
     * Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventsubscribe1">FwpmNetEventSubscribe1</a> function.
     * @param {Pointer<FWPM_NET_EVENT2>} event Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event2">FWPM_NET_EVENT2</a>*</b>
     * 
     * The net event information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, event) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_NET_EVENT2.Ptr, event)
    }

    /**
     * A FWPM_NET_EVENT_CALLBACK1 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_NET_EVENT_CALLBACK1 {
        /**
         * Creates a FWPM_NET_EVENT_CALLBACK1 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_NET_EVENT2) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_NET_EVENT2.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
