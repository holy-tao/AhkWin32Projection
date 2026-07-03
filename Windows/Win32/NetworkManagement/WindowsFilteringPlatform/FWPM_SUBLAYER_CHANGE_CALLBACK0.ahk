#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_SUBLAYER_CHANGE0.ahk" { FWPM_SUBLAYER_CHANGE0 }

/**
 * Is used to added custom behavior to the sublayer change notification process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayersubscribechanges0">FwpmSubLayerSubscribeChanges0</a> to register this callback function.
 * 
 * <b>FWPM_SUBLAYER_CHANGE_CALLBACK0</b> is a specific implementation of FWPM_SUBLAYER_CHANGE_CALLBACK. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-fwpm_sublayer_change_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBLAYER_CHANGE_CALLBACK0 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_SUBLAYER_CHANGE_CALLBACK0) {
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
     * Optional context pointer. It contains the value of the <i>context</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayersubscribechanges0">FwpmSubLayerSubscribeChanges0</a> function.
     * @param {Pointer<FWPM_SUBLAYER_CHANGE0>} change Type: [FWPM_SUBLAYER_CHANGE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_change0)*</b>
     * 
     * The change notification information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, change) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_SUBLAYER_CHANGE0.Ptr, change)
    }

    /**
     * A FWPM_SUBLAYER_CHANGE_CALLBACK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_SUBLAYER_CHANGE_CALLBACK0 {
        /**
         * Creates a FWPM_SUBLAYER_CHANGE_CALLBACK0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_SUBLAYER_CHANGE0) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_SUBLAYER_CHANGE0.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
