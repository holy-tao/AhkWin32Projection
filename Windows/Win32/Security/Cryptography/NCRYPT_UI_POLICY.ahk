#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the NCRYPT_UI_POLICY_PROPERTY property to contain strong key user interface information for a key.
 * @see https://docs.microsoft.com/windows/win32/api//ncrypt/ns-ncrypt-ncrypt_ui_policy
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_UI_POLICY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The version number of the structure. This member must contain 1.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A set of flags that provide additional user interface information or requirements.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NCRYPT_UI_PROTECT_KEY_FLAG"></a><a id="ncrypt_ui_protect_key_flag"></a><dl>
     * <dt><b>NCRYPT_UI_PROTECT_KEY_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the strong key user interface as needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG"></a><a id="ncrypt_ui_force_high_protection_flag"></a><dl>
     * <dt><b>NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Force high protection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG"></a><a id="ncrypt_ui_appcontainer_access_medium_flag"></a><dl>
     * <dt><b>NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An app container has accessed a medium key that is not strongly protected. For example, a key that is for user consent only, or is password or fingerprint protected.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the text that will be used in the title of the strong key dialog box when the key is completed. If this member is <b>NULL</b>, a default creation title will be used in the strong key dialog box.  This member is only used on key finalization.
     * @type {Pointer<Char>}
     */
    pszCreationTitle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the text that will be displayed in the strong key dialog box as the name of the key. If this member is <b>NULL</b>, a default name will be used in the strong key dialog box.  This member is used both when the key is completed and when the key is used.
     * @type {Pointer<Char>}
     */
    pszFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the text that will be displayed in the strong key dialog box as the description of the key. If this member is <b>NULL</b>, a default description will be used in the strong key dialog box.  This member is used both when the key is completed and when the key is used.
     * @type {Pointer<Char>}
     */
    pszDescription {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
