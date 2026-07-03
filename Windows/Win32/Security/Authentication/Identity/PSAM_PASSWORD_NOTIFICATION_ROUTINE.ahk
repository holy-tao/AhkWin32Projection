#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * Is implemented by a password filter DLL. It notifies the DLL that a password was changed.
 * @remarks
 * The <b>PasswordChangeNotify</b> function is called after the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nc-ntsecapi-psam_password_filter_routine">PasswordFilter</a> function has been called successfully and the new password has been stored.
 * 
 * This function must use the __stdcall calling convention and must be exported by the DLL.
 * 
 * When the <b>PasswordChangeNotify</b> routine is running, processing is blocked until the routine is finished. When appropriate, move any lengthy processing to a separate thread prior to returning from this routine.
 * 
 * This function is called only for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">password filters</a> that are installed and registered on the system.
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
 * <td>The password filter DLL provided by Microsoft</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/strong-password-enforcement-and-passfilt-dll">Strong Password Enforcement and Passfilt.dll</a>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nc-ntsecapi-psam_password_notification_routine
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_PASSWORD_NOTIFICATION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_PASSWORD_NOTIFICATION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} UserName The account name of the user whose password changed.
     * 
     * If the values of this parameter and the <i>NewPassword</i> parameter are <b>NULL</b>, this function should return <b>STATUS_SUCCESS</b>.
     * @param {Integer} RelativeId The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">relative identifier</a> (RID) of the user specified in <i>UserName</i>.
     * @param {Pointer<LSA_UNICODE_STRING>} NewPassword A new plaintext password for the user specified in <i>UserName</i>. When you have finished using the password, clear the information by calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * 
     * If the values of this parameter and the <i>UserName</i> parameter are <b>NULL</b>, this function should return <b>STATUS_SUCCESS</b>.
     * @returns {NTSTATUS} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the password of the user was changed, or that the values of both the <i>UserName</i> and <i>NewPassword</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(UserName, RelativeId, NewPassword) {
        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, UserName, UInt32, RelativeId, LSA_UNICODE_STRING.Ptr, NewPassword, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PSAM_PASSWORD_NOTIFICATION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_PASSWORD_NOTIFICATION_ROUTINE {
        /**
         * Creates a PSAM_PASSWORD_NOTIFICATION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, UInt32, LSA_UNICODE_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, UInt32, LSA_UNICODE_STRING.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
