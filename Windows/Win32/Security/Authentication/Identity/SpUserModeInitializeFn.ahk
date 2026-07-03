#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_USER_FUNCTION_TABLE.ahk" { SECPKG_USER_FUNCTION_TABLE }

/**
 * Called when a security support provider/authentication package (SSP/AP) DLL is loaded into the process space of a client/server application. This function provides the SECPKG_USER_FUNCTION_TABLE tables for each security package in the SSP/AP DLL.
 * @remarks
 * The <b>SpUserModeInitialize</b> function must be implemented by SSP/AP DLLs that contain user-mode security packages.
 * 
 * The <i>ppTables</i> parameter should contain one 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> for each user-mode security package deployed in the DLL. For more information on deploying security packages in DLLs, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/user-mode-initialization">User Mode Initialization</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpUserModeInitializeFn {
    value : IntPtr

    __value {
        set {
            if (value is SpUserModeInitializeFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} LsaVersion The version of the security provider DLL (either Secur32.dll or Security.dll).
     * @param {Pointer<Integer>} PackageVersion Pointer that returns the version of the SSP/AP DLL.
     * @param {Pointer<Pointer<SECPKG_USER_FUNCTION_TABLE>>} ppTables Pointer that returns an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structures. Each structure is a table of pointers to the user-mode functions implemented by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> deployed in the SSP/AP DLL.
     * @param {Pointer<Integer>} pcTables Pointer that returns the number of elements in the array pointed to by the <i>ppTables</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(LsaVersion, PackageVersion, ppTables, pcTables) {
        PackageVersionMarshal := PackageVersion is VarRef ? "uint*" : "ptr"
        ppTablesMarshal := ppTables is VarRef ? "ptr*" : "ptr"
        pcTablesMarshal := pcTables is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, LsaVersion, PackageVersionMarshal, PackageVersion, ppTablesMarshal, ppTables, pcTablesMarshal, pcTables, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpUserModeInitializeFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpUserModeInitializeFn {
        /**
         * Creates a SpUserModeInitializeFn pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "uint*", "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "uint*", "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
