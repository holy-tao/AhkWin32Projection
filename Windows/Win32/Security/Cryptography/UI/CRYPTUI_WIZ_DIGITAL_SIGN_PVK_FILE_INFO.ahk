#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used with the CRYPTUI_WIZ_DIGITAL_SIGN_INFO structure to contain information about the PVK file used by the digital signature wizard.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_pvk_file_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the path and file name of the PVK file.
     * @type {Pointer<PWSTR>}
     */
    pwszPvkFileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     * @type {Pointer<PWSTR>}
     */
    pwszProvName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Contains the provider type identifier. For more information about the provider types, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-provider-types">Cryptographic Provider Types</a>.
     * @type {Integer}
     */
    dwProvType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
