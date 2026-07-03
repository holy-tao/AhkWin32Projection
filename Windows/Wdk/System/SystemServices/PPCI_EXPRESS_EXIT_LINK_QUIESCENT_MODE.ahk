#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE {
    value : IntPtr

    __value {
        set {
            if (value is PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    Call() {
        result := DllCall(this.value, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE {
        /**
         * Creates a PPCI_EXPRESS_EXIT_LINK_QUIESCENT_MODE pointer that invokes the given AHK function when called.
         * @param {Func() => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
