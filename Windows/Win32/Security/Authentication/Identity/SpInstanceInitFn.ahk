#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_DLL_FUNCTIONS.ahk" { SECPKG_DLL_FUNCTIONS }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Initializes user-mode security packages in an SSP/AP.
 * @remarks
 * The <b>SpInstanceInit</b> function is called once when the SSP/AP is loaded into the user-mode process, after the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function is called.
 * 
 * SSP/APs must implement the <b>SpInstanceInit</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpInstanceInit</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spinstanceinitfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpInstanceInitFn {
    value : IntPtr

    __value {
        set {
            if (value is SpInstanceInitFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Version The version of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA).
     * @param {Pointer<SECPKG_DLL_FUNCTIONS>} FunctionTable Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_dll_functions">SECPKG_DLL_FUNCTIONS</a> structure containing the support functions that the security package can use in user-mode.
     * @param {Pointer<Pointer<Void>>} UserFunctions This parameter is not used.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(_Version, FunctionTable, UserFunctions) {
        UserFunctionsMarshal := UserFunctions is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, _Version, SECPKG_DLL_FUNCTIONS.Ptr, FunctionTable, UserFunctionsMarshal, UserFunctions, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpInstanceInitFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpInstanceInitFn {
        /**
         * Creates a SpInstanceInitFn pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, SECPKG_DLL_FUNCTIONS, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, SECPKG_DLL_FUNCTIONS.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
