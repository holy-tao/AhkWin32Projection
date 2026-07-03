#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Transforms a marshaled string back into its original form, and decrypts the unmarshaled string.
 * @remarks
 * A pointer to the <b>CrediUnmarshalandDecodeString</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table">LSA_SECPKG_FUNCTION_TABLE</a> structure received by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-crediunmarshalanddecodestringfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CrediUnmarshalandDecodeStringFn {
    value : IntPtr

    __value {
        set {
            if (value is CrediUnmarshalandDecodeStringFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} MarshaledString The marshaled, encrypted string.
     * @param {Pointer<Pointer<Integer>>} _Blob A pointer to the unmarshaled, decrypted string.
     * @param {Pointer<Integer>} BlobSize A pointer to the size, in bytes, of the buffer pointed to by the <i>Blob</i> parameter.
     * @param {Pointer<Integer>} IsFailureFatal A pointer to a <b>BOOLEAN</b> variable to receive a value that indicates whether the caller should complete the operation. If the value of this parameter is <b>TRUE</b>, the caller should not complete the operation.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS, or an informational status code.
     * 
     * If the function fails, return an NTSTATUS error code that indicates the reason it failed.
     */
    Call(MarshaledString, _Blob, BlobSize, IsFailureFatal) {
        MarshaledString := MarshaledString is String ? StrPtr(MarshaledString) : MarshaledString

        _BlobMarshal := _Blob is VarRef ? "ptr*" : "ptr"
        BlobSizeMarshal := BlobSize is VarRef ? "uint*" : "ptr"
        IsFailureFatalMarshal := IsFailureFatal is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", MarshaledString, _BlobMarshal, _Blob, BlobSizeMarshal, BlobSize, IsFailureFatalMarshal, IsFailureFatal, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A CrediUnmarshalandDecodeStringFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CrediUnmarshalandDecodeStringFn {
        /**
         * Creates a CrediUnmarshalandDecodeStringFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr*", "uint*", "char*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr*", "uint*", "char*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
