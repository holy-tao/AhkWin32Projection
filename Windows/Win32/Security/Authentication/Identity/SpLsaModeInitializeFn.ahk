#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_FUNCTION_TABLE.ahk" { SECPKG_FUNCTION_TABLE }

/**
 * Provides the LSA with pointers to the functions implemented by each security package in the SSP/AP DLL.
 * @remarks
 * The <b>SpLsaModeInitialize</b> function must be implemented by SSP/AP DLLs.
 * 
 * The <i>ppTables</i> parameter should contain one 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> for each security package deployed in the DLL.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpLsaModeInitializeFn {
    value : IntPtr

    __value {
        set {
            if (value is SpLsaModeInitializeFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} LsaVersion The version of the LSA.
     * @param {Pointer<Integer>} PackageVersion Pointer to a <b>ULONG</b> that returns the SSP/AP DLL version number.
     * @param {Pointer<Pointer<SECPKG_FUNCTION_TABLE>>} ppTables Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structures. Each structure is a table of pointers to the functions implemented by a security package deployed in the SSP/AP DLL.
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
     * A SpLsaModeInitializeFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpLsaModeInitializeFn {
        /**
         * Creates a SpLsaModeInitializeFn pointer that invokes the given AHK function when called.
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
