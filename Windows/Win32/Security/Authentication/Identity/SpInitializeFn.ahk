#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_SECPKG_FUNCTION_TABLE.ahk" { LSA_SECPKG_FUNCTION_TABLE }
#Import ".\SECPKG_PARAMETERS.ahk" { SECPKG_PARAMETERS }

/**
 * Is called once by the Local Security Authority (LSA) to provide a security package with general security information and a dispatch table of support functions.
 * @remarks
 * If <b>SpInitialize</b> returns an NTSTATUS error code to the LSA, the package will be unloaded, and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) will not include it in the list of available security packages.
 * 
 * SSP/APs must implement the <b>SpInitialize</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the SSP/AP's implementation of the <b>SpInitialize</b> function must be in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure passed to the LSA from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spinitializefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpInitializeFn {
    value : IntPtr

    __value {
        set {
            if (value is SpInitializeFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} PackageId A unique identifier the LSA assigns to each security package. The value is valid until the system is restarted.
     * @param {Pointer<SECPKG_PARAMETERS>} Parameters A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_parameters">SECPKG_PARAMETERS</a> structure containing primary domain and machine state information.
     * @param {Pointer<LSA_SECPKG_FUNCTION_TABLE>} FunctionTable Pointer to a table of LSA support functions that a security package can call.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS, or an informational status code.
     * 
     * If the function fails, return an NTSTATUS error code indicating the reason it failed. For more information, see Remarks.
     */
    Call(PackageId, Parameters, FunctionTable) {
        result := DllCall(this.value, IntPtr, PackageId, SECPKG_PARAMETERS.Ptr, Parameters, LSA_SECPKG_FUNCTION_TABLE.Ptr, FunctionTable, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpInitializeFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpInitializeFn {
        /**
         * Creates a SpInitializeFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SECPKG_PARAMETERS, LSA_SECPKG_FUNCTION_TABLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SECPKG_PARAMETERS.Ptr, LSA_SECPKG_FUNCTION_TABLE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
