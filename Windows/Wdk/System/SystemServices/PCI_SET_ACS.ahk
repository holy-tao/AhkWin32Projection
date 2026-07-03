#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_ACS_BIT.ahk" { PCI_ACS_BIT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SET_ACS {
    value : IntPtr

    __value {
        set {
            if (value is PCI_SET_ACS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {PCI_ACS_BIT} EnableSourceValidation 
     * @param {PCI_ACS_BIT} EnableTranslationBlocking 
     * @param {PCI_ACS_BIT} EnableP2PRequestRedirect 
     * @param {PCI_ACS_BIT} EnableCompletionRedirect 
     * @param {PCI_ACS_BIT} EnableUpstreamForwarding 
     * @param {PCI_ACS_BIT} EnableEgressControl 
     * @param {PCI_ACS_BIT} EnableDirectTranslatedP2P 
     * @returns {NTSTATUS} 
     */
    Call(_Context, EnableSourceValidation, EnableTranslationBlocking, EnableP2PRequestRedirect, EnableCompletionRedirect, EnableUpstreamForwarding, EnableEgressControl, EnableDirectTranslatedP2P) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, PCI_ACS_BIT, EnableSourceValidation, PCI_ACS_BIT, EnableTranslationBlocking, PCI_ACS_BIT, EnableP2PRequestRedirect, PCI_ACS_BIT, EnableCompletionRedirect, PCI_ACS_BIT, EnableUpstreamForwarding, PCI_ACS_BIT, EnableEgressControl, PCI_ACS_BIT, EnableDirectTranslatedP2P, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCI_SET_ACS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_SET_ACS {
        /**
         * Creates a PCI_SET_ACS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, PCI_ACS_BIT, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
