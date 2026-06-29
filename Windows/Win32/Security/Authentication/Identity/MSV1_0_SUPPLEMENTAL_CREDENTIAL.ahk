#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS.ahk" { MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS }

/**
 * The MSV1_0_SUPPLEMENTAL_CREDENTIAL structure is used to pass credentials into MSV1_0 from Kerberos or custom authentication package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_supplemental_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_SUPPLEMENTAL_CREDENTIAL {
    #StructPack 4

    /**
     * Specifies the version number of the credential structure and related credential content.
     */
    Version : UInt32

    Flags : MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS

    /**
     * Contains the  LM password. The size of this array is defined by the constant <b>MSV1_0_OWF_PASSWORD_LENGTH</b>. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     */
    LmPassword : Int8[16]

    /**
     * A string that contains the Windows password. The size of this array is defined by the constant <b>MSV1_0_OWF_PASSWORD_LENGTH</b>. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>.
     */
    NtPassword : Int8[16]

}
