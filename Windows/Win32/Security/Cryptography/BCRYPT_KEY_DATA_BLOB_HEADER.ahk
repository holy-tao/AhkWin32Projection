#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to contain information about a key data BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_key_data_blob_header
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_KEY_DATA_BLOB_HEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The magic value for the key.
     * 
     * 
     * This member must be the following value.
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the numeric version of the key.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_KEY_DATA_BLOB_VERSION1"></a><a id="bcrypt_key_data_blob_version1"></a><dl>
     * <dt><b>BCRYPT_KEY_DATA_BLOB_VERSION1</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 1.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the key data.
     * @type {Integer}
     */
    cbKeyData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
