#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used with the CRYPTUI_WIZ_DIGITAL_SIGN_INFO structure to contain information about the PVK file used by the digital signature wizard.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_pvk_file_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * A pointer to a null-terminated Unicode string that contains the path and file name of the PVK file.
     */
    pwszPvkFileName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     */
    pwszProvName : PWSTR

    /**
     * Contains the provider type identifier. For more information about the provider types, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-provider-types">Cryptographic Provider Types</a>.
     */
    dwProvType : UInt32

}
