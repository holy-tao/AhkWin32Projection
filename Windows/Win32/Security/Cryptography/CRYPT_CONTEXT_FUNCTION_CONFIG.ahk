#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains configuration information for a cryptographic function of a CNG context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_function_config
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXT_FUNCTION_CONFIG {
    #StructPack 4

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
     */
    dwFlags : UInt32

    dwReserved : UInt32

}
