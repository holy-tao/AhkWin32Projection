#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @param {Integer} SupplementalCredSize 
     * @param {Integer} SupplementalCreds 
     * @param {BOOLEAN} Synchronous 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, SupplementalCredSize, SupplementalCreds, Synchronous) {
        result := DllCall(this.value, LUID.Ptr, LogonId, UInt32, SupplementalCredSize, IntPtr, SupplementalCreds, BOOLEAN, Synchronous, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS {
        /**
         * Creates a PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func(LUID, UInt32, IntPtr, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, UInt32, IntPtr, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
