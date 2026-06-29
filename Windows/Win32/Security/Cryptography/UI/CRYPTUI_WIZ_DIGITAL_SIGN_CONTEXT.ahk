#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the CryptUIWizDigitalSign function to contain information about a BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_context
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * The size, in bytes, of the BLOB pointed to by the <b>pbBlob</b> member.
     */
    cbBlob : UInt32

    /**
     * A pointer to the signed BLOB.
     */
    pbBlob : IntPtr

}
