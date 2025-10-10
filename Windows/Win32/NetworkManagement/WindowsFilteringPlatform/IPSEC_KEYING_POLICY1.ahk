#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an unordered set of keying modules that will be tried for IPsec.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_keying_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEYING_POLICY1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of keying modules in the array.
     * @type {Integer}
     */
    numKeyMods {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>GUID*</b>
     * 
     * Array of distinct keying modules.
     * @type {Pointer<Guid>}
     */
    keyModKeys {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_KEYING_POLICY_FLAG_TERMINATING_MATCH"></a><a id="ipsec_keying_policy_flag_terminating_match"></a><dl>
     * <dt><b>IPSEC_KEYING_POLICY_FLAG_TERMINATING_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces the use of a Kerberos proxy server when acting as initiator.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
