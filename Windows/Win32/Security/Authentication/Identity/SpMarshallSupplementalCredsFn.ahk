#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Converts supplemental credentials from a public format into a format suitable for local procedure calls.
 * @remarks
 * SSP/APs must implement the <b>SpMarshallSupplementalCreds</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpMarshallSupplementalCreds</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spmarshallsupplementalcredsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpMarshallSupplementalCredsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpMarshallSupplementalCredsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} CredentialSize Specifies the size of the supplemental credentials.
     * @param {Integer} Credentials Pointer to the supplemental credentials.
     * @param {Pointer<Integer>} MarshalledCredSize Pointer to the size of the <i>MarshalledCreds</i> buffer.
     * @param {Pointer<Pointer<Void>>} MarshalledCreds Pointer that receives the address of the buffer containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> credentials. Allocate the memory for this buffer by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateHeap</a> function.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(CredentialSize, Credentials, MarshalledCredSize, MarshalledCreds) {
        MarshalledCredSizeMarshal := MarshalledCredSize is VarRef ? "uint*" : "ptr"
        MarshalledCredsMarshal := MarshalledCreds is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, CredentialSize, IntPtr, Credentials, MarshalledCredSizeMarshal, MarshalledCredSize, MarshalledCredsMarshal, MarshalledCreds, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpMarshallSupplementalCredsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpMarshallSupplementalCredsFn {
        /**
         * Creates a SpMarshallSupplementalCredsFn pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, IntPtr, "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr, "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
