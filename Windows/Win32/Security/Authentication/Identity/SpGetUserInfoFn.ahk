#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import ".\SECURITY_USER_DATA.ahk" { SECURITY_USER_DATA }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Retrieves information about a logon session.
 * @remarks
 * The <i>Flags</i> value NO_LONG_NAMES provides compatibility with Microsoft NTLM.
 * 
 * SSP/APs must implement the <b>SpGetUserInfo</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpGetUserInfo</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spgetuserinfofn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetUserInfoFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetUserInfoFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId Pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LUID</a> containing the logon session for which information is to be retrieved.
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<SECURITY_USER_DATA>>} _UserData Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-security_user_data">SecurityUserData</a> structure. If the function call succeeds, the user information is returned in this structure. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> should allocate the memory for this structure in the caller's address space. The caller is responsible for freeing the buffer by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(LogonId, Flags, _UserData) {
        _UserDataMarshal := _UserData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LUID.Ptr, LogonId, UInt32, Flags, _UserDataMarshal, _UserData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpGetUserInfoFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetUserInfoFn {
        /**
         * Creates a SpGetUserInfoFn pointer that invokes the given AHK function when called.
         * @param {Func(LUID, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
