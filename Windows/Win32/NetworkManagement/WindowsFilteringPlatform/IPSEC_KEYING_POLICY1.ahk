#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines an unordered set of keying modules that will be tried for IPsec. (IPSEC_KEYING_POLICY1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_keying_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEYING_POLICY1 {
    #StructPack 8

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of keying modules in the array.
     */
    numKeyMods : UInt32

    /**
     * Type: <b>GUID*</b>
     * 
     * Array of distinct keying modules.
     */
    keyModKeys : Guid.Ptr

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
     */
    flags : UInt32

}
