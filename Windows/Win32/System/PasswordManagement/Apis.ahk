#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.PasswordManagement
 * @version v4.0.30319
 */
class PasswordManagement {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Changes the password of a user account.
     * @param {PWSTR} ServerName A pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) name of the server on which to operate. If this parameter is <b>NULL</b>, the function operates on the local computer.
     * @param {PWSTR} UserName A pointer to a null-terminated Unicode string that specifies the name of the user whose password is being changed.
     * @param {BOOLEAN} LmOldPresent A <b>BOOLEAN</b> that specifies whether the password designated by <i>LmOldOwfPassword</i> is valid. <i>LmOldPresent</i> is <b>FALSE</b> if the <i>LmOldOwfPassword</i> password is greater than 128-bits in length, and therefore cannot be represented by a Lan Manager (LM) one-way function (OWF) password. Otherwise, it is <b>TRUE</b>.
     * @param {Pointer<LM_OWF_PASSWORD>} LmOldOwfPassword A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-lm_owf_password">LM_OWF_PASSWORD</a> structure that contains the OWF of the user's current LM  password. This parameter is ignored if <i>LmOldPresent</i> is <b>FALSE</b>.
     * @param {Pointer<LM_OWF_PASSWORD>} LmNewOwfPassword A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-lm_owf_password">LM_OWF_PASSWORD</a> structure that contains the OWF of the user's new LM password.
     * @param {Pointer<LM_OWF_PASSWORD>} NtOldOwfPassword A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325731(v=vs.85)">NT_OWF_PASSWORD</a> structure that contains the OWF of the user's current NT password.
     * @param {Pointer<LM_OWF_PASSWORD>} NtNewOwfPassword A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325731(v=vs.85)">NT_OWF_PASSWORD</a> structure that contains the OWF of the user's new NT password.
     * @returns {Integer} If the function succeeds, the return value is <b>STATUS_SUCCESS (0x00000000)</b>.
     * 
     * If the function fails, the return value is one of the following error codes from ntstatus.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * <dt>0xC0000022</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have the appropriate privilege to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_HANDLE</b></dt>
     * <dt>0xC0000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified server or user name was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ILL_FORMED_PASSWORD</b></dt>
     * <dt>0xC000006B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * New password is poorly formed, for example, it contains characters that cannot be entered from the keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PASSWORD_RESTRICTION</b></dt>
     * <dt>0xC000006C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A restriction prevents the password from being changed. Possible restrictions include time restrictions on how often a password is allowed to be changed or length restrictions on the provided password. This error is also returned if the new password matched a password in the recent history log for the account. Security administrators specify how many of the most recently used passwords are not available for re-use. These are kept in the password recent history log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_WRONG_PASSWORD</b></dt>
     * <dt>0xC000006A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The old password parameter does not match the user's current password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
     * <dt>0xC00000DD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controlelr is not in an enabled state. The domain controller must be enabled for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
     * <dt>0xC00000DE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller is serving in the incorrect role to perform the requested operation. The operation can only be performed by the primary domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER_MIX</b></dt>
     * <dt>0xC0000030</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>LmOldPresent</i> parameter is not correct for the contents of the old and new  parameter pairs.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mschapp/nf-mschapp-mschapsrvchangepassword
     * @since windows5.1.2600
     */
    static MSChapSrvChangePassword(ServerName, UserName, LmOldPresent, LmOldOwfPassword, LmNewOwfPassword, NtOldOwfPassword, NtNewOwfPassword) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        UserName := UserName is String ? StrPtr(UserName) : UserName

        result := DllCall("ADVAPI32.dll\MSChapSrvChangePassword", "ptr", ServerName, "ptr", UserName, "char", LmOldPresent, "ptr", LmOldOwfPassword, "ptr", LmNewOwfPassword, "ptr", NtOldOwfPassword, "ptr", NtNewOwfPassword, "uint")
        return result
    }

    /**
     * The MSChapSrvChangePassword2 function changes the password of a user account while supporting mutual encryption.
     * @param {PWSTR} ServerName A pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) name of the server on which to operate. If this parameter is <b>NULL</b>, the function operates on the local computer.
     * @param {PWSTR} UserName A pointer to a null-terminated Unicode string that specifies the name of the user whose password is being changed.
     * @param {Pointer<SAMPR_ENCRYPTED_USER_PASSWORD>} NewPasswordEncryptedWithOldNt A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-sampr_encrypted_user_password">SAMPR_ENCRYPTED_USER_PASSWORD</a> structure that contains the new clear text password encrypted using the current NT one-way function (OWF) password hash as the encryption key.
     * 
     * <div class="alert"><b>Note</b>  Use  the <b>NewPasswordEncryptedWithOldNtPasswordHash()</b> function as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, section A.11 to calculate the cipher for <i>NewPasswordEncryptedWithOldNt</i>.</div>
     * <div> </div>
     * @param {Pointer<ENCRYPTED_LM_OWF_PASSWORD>} OldNtOwfPasswordEncryptedWithNewNt A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325729(v=vs.85)">ENCRYPTED_NT_OWF_PASSWORD</a> structure that contains the old NT OWF password hash encrypted using the new NT OWF password hash as the encryption key.
     * @param {BOOLEAN} LmPresent A <b>BOOLEAN</b> that specifies if the current Lan Manager (LM) or NT OWF password hashes are used as the encryption keys to generate the <i>NewPasswordEncryptedWithOldNt</i> and <i>OldNtOwfPasswordEncryptedWithNewNt</i> ciphers. If <b>TRUE</b>, the  LM OWF password hashes are used rather than the NT OWF password hashes.
     * @param {Pointer<SAMPR_ENCRYPTED_USER_PASSWORD>} NewPasswordEncryptedWithOldLm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-sampr_encrypted_user_password">SAMPR_ENCRYPTED_USER_PASSWORD</a> structure that contains the new clear text password encrypted using the current LM OWF password hash.
     * 
     * <div class="alert"><b>Note</b>  Use  the <b>NewPasswordEncryptedWithOldLmPasswordHash()</b> function as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, section A.15 to calculate the cipher for <i>NewPasswordEncryptedWithOldLm</i>.</div>
     * <div> </div>
     * @param {Pointer<ENCRYPTED_LM_OWF_PASSWORD>} OldLmOwfPasswordEncryptedWithNewLmOrNt A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-encrypted_lm_owf_password">ENCRYPTED_LM_OWF_PASSWORD</a> structure that contains the current LM OWF password hash encrypted using the new LM OWF password hash.
     * @returns {Integer} If the function succeeds, the return value is <b>STATUS_SUCCESS (0x00000000)</b>.
     * 
     * If the function fails, the return value is one of the following error codes from ntstatus.h.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * <dt>0xC0000022</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have the appropriate privilege to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_HANDLE</b></dt>
     * <dt>0xC0000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified server or user name was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ILL_FORMED_PASSWORD</b></dt>
     * <dt>0xC000006B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * New password is poorly formed, for example, it contains characters that cannot be entered from the keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_PASSWORD_RESTRICTION</b></dt>
     * <dt>0xC000006C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A restriction prevents the password from being changed. Possible restrictions include time restrictions on how often a password is allowed to be changed or length restrictions on the provided password. This error is also returned if the new password matched a password in the recent history log for the account. Security administrators specify how many of the most recently used passwords are not available for re-use. These are kept in the password recent history log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_WRONG_PASSWORD</b></dt>
     * <dt>0xC000006A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The old password parameter does not match the user's current password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_STATE</b></dt>
     * <dt>0xC00000DD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller is not in an enabled state. The domain controller must be enabled for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_DOMAIN_ROLE</b></dt>
     * <dt>0xC00000DE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain controller is serving in the incorrect role to perform the requested operation. The operation can only be performed by the primary domain controller.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mschapp/nf-mschapp-mschapsrvchangepassword2
     * @since windows5.1.2600
     */
    static MSChapSrvChangePassword2(ServerName, UserName, NewPasswordEncryptedWithOldNt, OldNtOwfPasswordEncryptedWithNewNt, LmPresent, NewPasswordEncryptedWithOldLm, OldLmOwfPasswordEncryptedWithNewLmOrNt) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        UserName := UserName is String ? StrPtr(UserName) : UserName

        result := DllCall("ADVAPI32.dll\MSChapSrvChangePassword2", "ptr", ServerName, "ptr", UserName, "ptr", NewPasswordEncryptedWithOldNt, "ptr", OldNtOwfPasswordEncryptedWithNewNt, "char", LmPresent, "ptr", NewPasswordEncryptedWithOldLm, "ptr", OldLmOwfPasswordEncryptedWithNewLmOrNt, "uint")
        return result
    }

;@endregion Methods
}
