#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_EXTENDED_INFORMATION.ahk" { SECPKG_EXTENDED_INFORMATION }
#Import ".\SECPKG_EXTENDED_INFORMATION_CLASS.ahk" { SECPKG_EXTENDED_INFORMATION_CLASS }

/**
 * Sets extended information about the security package.
 * @remarks
 * To retrieve extended information, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn">SpGetExtendedInformation</a> function is called.
 * 
 * An SSP/AP must implement the <b>SpSetExtendedInformation</b> function; however, the actual name given to the implementation is up to the package developer.
 * 
 * A pointer to the <b>SpSetExtendedInformation</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spsetextendedinformationfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpSetExtendedInformationFn {
    value : IntPtr

    __value {
        set {
            if (value is SpSetExtendedInformationFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SECPKG_EXTENDED_INFORMATION_CLASS} _Class A 
     * <a href="https://docs.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_extended_information_class">SECPKG_EXTENDED_INFORMATION_CLASS</a> enumeration value indicating the type of extended information.
     * @param {Pointer<SECPKG_EXTENDED_INFORMATION>} Info Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_extended_information">SECPKG_EXTENDED_INFORMATION</a> structure containing the extended information set.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(_Class, Info) {
        result := DllCall(this.value, SECPKG_EXTENDED_INFORMATION_CLASS, _Class, SECPKG_EXTENDED_INFORMATION.Ptr, Info, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpSetExtendedInformationFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpSetExtendedInformationFn {
        /**
         * Creates a SpSetExtendedInformationFn pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_EXTENDED_INFORMATION_CLASS, SECPKG_EXTENDED_INFORMATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_EXTENDED_INFORMATION_CLASS, SECPKG_EXTENDED_INFORMATION.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
