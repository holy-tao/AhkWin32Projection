#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to contain information about a key data BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_key_data_blob_header
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_KEY_DATA_BLOB_HEADER {
    #StructPack 4

    /**
     * The magic value for the key.
     * 
     * 
     * This member must be the following value.
     */
    dwMagic : UInt32

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
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of the key data.
     */
    cbKeyData : UInt32

}
