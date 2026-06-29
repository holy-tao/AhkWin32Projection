#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SAMPR_ENCRYPTED_USER_PASSWORD stores a user's encrypted password.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-sampr_encrypted_user_password
 * @namespace Windows.Win32.System.PasswordManagement
 */
export default struct SAMPR_ENCRYPTED_USER_PASSWORD {
    #StructPack 1

    /**
     * An array contains an encrypted password. The contents of the array are calculated using either the <b>NewPasswordEncryptedWithOldNtPasswordHash</b> or <b>NewPasswordEncryptedWithOldLmPasswordHash</b> functions as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, sections A.11 and A.15 respectively.
     */
    Buffer : Int8[516]

}
