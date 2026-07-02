#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_FAILURE_REASON.ahk" { SECPKG_FAILURE_REASON }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_SECPKG_FAILURE_REASON {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_SECPKG_FAILURE_REASON) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} PackageID 
     * @param {Pointer<SECPKG_FAILURE_REASON>} Reason 
     * @returns {NTSTATUS} 
     */
    Call(PackageID, Reason) {
        result := DllCall(this.value, IntPtr, PackageID, SECPKG_FAILURE_REASON.Ptr, Reason, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_SECPKG_FAILURE_REASON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_SECPKG_FAILURE_REASON {
        /**
         * Creates a PLSA_GET_SECPKG_FAILURE_REASON pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SECPKG_FAILURE_REASON) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SECPKG_FAILURE_REASON.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
