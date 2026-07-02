#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_EXTENDED_INFORMATION_CLASS.ahk" { SECPKG_EXTENDED_INFORMATION_CLASS }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_EXTENDED_INFORMATION.ahk" { SECPKG_EXTENDED_INFORMATION }

/**
 * Provides extended information about a security package.
 * @remarks
 * Extended information is set using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spsetextendedinformationfn">SpSetExtendedInformation</a> function.
 * 
 * An SSP/AP must implement the <b>SpGetExtendedInformation</b> function; however, the actual name given to the implementation is up to the package developer.
 * 
 * A pointer to the <b>SpGetExtendedInformation</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetExtendedInformationFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetExtendedInformationFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SECPKG_EXTENDED_INFORMATION_CLASS} _Class A value from the 
     * <a href="https://docs.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_extended_information_class">SECPKG_EXTENDED_INFORMATION_CLASS</a> enumeration indicating the type of extended information.
     * @param {Pointer<Pointer<SECPKG_EXTENDED_INFORMATION>>} ppInformation Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_extended_information">SECPKG_EXTENDED_INFORMATION</a> structure allocated by the security package. If the function call succeeds, the returned structure contains the requested information.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(_Class, ppInformation) {
        ppInformationMarshal := ppInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, SECPKG_EXTENDED_INFORMATION_CLASS, _Class, ppInformationMarshal, ppInformation, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpGetExtendedInformationFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetExtendedInformationFn {
        /**
         * Creates a SpGetExtendedInformationFn pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_EXTENDED_INFORMATION_CLASS, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_EXTENDED_INFORMATION_CLASS, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
