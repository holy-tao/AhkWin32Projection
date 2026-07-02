#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AsnObjectIdentifier.ahk" { AsnObjectIdentifier }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONINITEX {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONINITEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<AsnObjectIdentifier>} pNextSupportedRegion 
     * @returns {BOOL} 
     */
    Call(pNextSupportedRegion) {
        result := DllCall(this.value, AsnObjectIdentifier.Ptr, pNextSupportedRegion, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONINITEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONINITEX {
        /**
         * Creates a PFNSNMPEXTENSIONINITEX pointer that invokes the given AHK function when called.
         * @param {Func(AsnObjectIdentifier) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AsnObjectIdentifier.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
