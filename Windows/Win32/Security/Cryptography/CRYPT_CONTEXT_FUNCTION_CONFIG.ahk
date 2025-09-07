#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains configuration information for a cryptographic function of a CNG context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_function_config
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CONTEXT_FUNCTION_CONFIG extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A set of flags that determine the options for the context function configuration. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_EXCLUSIVE"></a><a id="crypt_exclusive"></a><dl>
     * <dt><b>CRYPT_EXCLUSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restricts the set of usable providers for this function to only those that this function is specifically registered to support.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
