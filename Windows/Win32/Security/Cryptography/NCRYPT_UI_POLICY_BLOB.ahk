#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the NCRYPT\_UI\_POLICY\_PROPERTY property to contain user interface information for a key.
 * @remarks
 * This structure is included in the Ncrypt\_provider.h header. To use the structure, you must download the [Cryptographic Provider Development Kit](/collaborate/connect-redirect?InvitationID=CSDK-GYTG-R2PX&ProgramID=7264) from Microsoft Connect.
 * @see https://learn.microsoft.com/windows/win32/SecCNG/ncrypt-ui-policy-blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_UI_POLICY_BLOB extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

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
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                                                  | Meaning                                                     |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
     * | <span id="NCRYPT_UI_PROTECT_KEY_FLAG"></span><span id="ncrypt_ui_protect_key_flag"></span><dl> <dt>**NCRYPT\_UI\_PROTECT\_KEY\_FLAG**</dt> <dt>0x00000001</dt> </dl>                                | Display the strong key user interface as needed.<br/> |
     * | <span id="NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG"></span><span id="ncrypt_ui_force_high_protection_flag"></span><dl> <dt>**NCRYPT\_UI\_FORCE\_HIGH\_PROTECTION\_FLAG**</dt> <dt>0x00000002</dt> </dl> | Force high protection.<br/>                           |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The length, in bytes, of the creation title. The creation title is a null-terminated Unicode string that specifies the text that is used as the title of the strong key dialog box when the key is completed. The creation title must be placed immediately following the **NCRYPT\_UI\_POLICY\_BLOB** structure. If the value of the **cbCreationTitle** member is set to 0, a default creation title is used for the title of the strong key dialog box. This member is only used on key finalization.
     * @type {Integer}
     */
    cbCreationTitle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The length, in bytes, of the friendly name of the key. The friendly name is a null-terminated Unicode string that contains the text that is displayed in the strong key dialog box as the name of the key. The friendly name must be placed immediately following the creation title in this BLOB. If the value of the **cbFriendlyName** member is set to 0, a default name is used in the strong key dialog box. This member is used both when the key is completed and when the key is used.
     * @type {Integer}
     */
    cbFriendlyName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The length, in bytes, of the key description. The key description is a null-terminated Unicode string that contains the text that is displayed in the strong key dialog box as the description of the key. The description value must be placed immediately following the friendly name in this BLOB. If the value of the **cbDescription** member is set to 0, a default description is used in the strong key dialog box. This member is used both when the key is completed and when the key is used.
     * @type {Integer}
     */
    cbDescription {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
