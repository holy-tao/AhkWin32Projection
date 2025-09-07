#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to contain information about a CNG key.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncryptkeyname
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptKeyName extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the key.
     * @type {Pointer<Ptr>}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic algorithm that the key was created with. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     * @type {Pointer<Ptr>}
     */
    pszAlgid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwLegacyKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A set of flags that provide more information about the key. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NCRYPT_MACHINE_KEY_FLAG"></a><a id="ncrypt_machine_key_flag"></a><dl>
     * <dt><b>NCRYPT_MACHINE_KEY_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key applies to the local computer. If this flag is not present, the key applies to the current user.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
