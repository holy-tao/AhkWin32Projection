#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * Implemented by a password filter DLL. The value returned by this function determines whether the new password is accepted by the system.
 * @remarks
 * Password change requests may be made when users specify a new password, accounts are created and when administrators override a password.
 * 
 * This function must use the __stdcall calling convention and must be exported by the DLL.
 * 
 * When the <b>PasswordFilter</b> routine is running, processing is blocked until the routine is finished. When appropriate, move any lengthy processing to a separate thread prior to returning from this routine.
 * 
 * This function is called only for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">password filters</a> that are installed and registered on a system.
 * 
 * Any process exception that is not handled within this function may cause security-related failures system-wide. Structured exception handling should be used when appropriate.
 * 
 * <table>
 * <tr>
 * <th>For information about</th>
 * <th>See</th>
 * </tr>
 * <tr>
 * <td>Programming issues when implementing a password filter DLL</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/password-filter-programming-considerations">Password Filter Programming Considerations</a>
 * </td>
 * </tr>
 * <tr>
 * <td>How to install and register your own password filter DLL</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/installing-and-registering-a-password-filter-dll">Installing and Registering a Password Filter DLL</a>
 * </td>
 * </tr>
 * <tr>
 * <td>The password filter DLL provided by Microsoft </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/strong-password-enforcement-and-passfilt-dll">Strong Password Enforcement and Passfilt.dll</a>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nc-ntsecapi-psam_password_filter_routine
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_PASSWORD_FILTER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_PASSWORD_FILTER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that represents the name of the user whose password changed.
     * @param {Pointer<LSA_UNICODE_STRING>} FullName Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that represents the full name of the user whose password changed.
     * @param {Pointer<LSA_UNICODE_STRING>} Password Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that represents the new plaintext password. When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {BOOLEAN} SetOperation <b>TRUE</b> if the password was set rather than changed.
     * @returns {BOOLEAN} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return <b>TRUE</b> if the new password is valid with respect to the password policy implemented in the password filter DLL. When <b>TRUE</b> is returned, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) continues to evaluate the password by calling any other password filters installed on the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return <b>FALSE</b> if the new password is not valid with respect to the password policy implemented in the password filter DLL. When <b>FALSE</b> is returned, the LSA returns the ERROR_ILL_FORMED_PASSWORD (1324) status code to the source of the password change request.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(AccountName, FullName, Password, SetOperation) {
        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, AccountName, LSA_UNICODE_STRING.Ptr, FullName, LSA_UNICODE_STRING.Ptr, Password, BOOLEAN, SetOperation, BOOLEAN)
        return result
    }

    /**
     * A PSAM_PASSWORD_FILTER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_PASSWORD_FILTER_ROUTINE {
        /**
         * Creates a PSAM_PASSWORD_FILTER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, BOOLEAN) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, BOOLEAN, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
