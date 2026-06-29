#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about the public key BLOB used by the CryptUIWizDigitalSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_blob_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * A pointer to a <b>GUID</b> that contains the GUID that identifies the Session Initiation Protocol (SIP) functions to load.
     */
    pGuidSubject : Guid.Ptr

    /**
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> pointed to by the <b>pbBlob</b> member.
     */
    cbBlob : UInt32

    /**
     * A pointer to the BLOB to sign.
     */
    pbBlob : IntPtr

    /**
     * A pointer to a null-terminated Unicode string that contains the display name of the BLOB to sign.
     */
    pwszDisplayName : PWSTR

}
