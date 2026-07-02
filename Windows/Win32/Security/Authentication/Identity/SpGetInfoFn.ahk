#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecPkgInfoA.ahk" { SecPkgInfoA }

/**
 * Provides general information about the security package, such as its name and capabilities.
 * @remarks
 * It is safe to place pointers to constant or dynamic data into the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure—the LSA will make a copy of the data prior to forwarding it.
 * 
 * SSP/APs must implement the <b>SpGetInfo</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpGetInfo</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spgetinfofn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetInfoFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetInfoFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SecPkgInfoA>} PackageInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkginfoa">SecPkgInfo</a> structure that is allocated by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) and must be populated by the package.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(PackageInfo) {
        result := DllCall(this.value, SecPkgInfoA.Ptr, PackageInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpGetInfoFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetInfoFn {
        /**
         * Creates a SpGetInfoFn pointer that invokes the given AHK function when called.
         * @param {Func(SecPkgInfoA) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecPkgInfoA.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
