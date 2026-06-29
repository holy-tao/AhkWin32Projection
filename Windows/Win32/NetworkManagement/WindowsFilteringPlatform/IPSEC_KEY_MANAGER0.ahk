#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used to register key management callbacks with IPsec.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_key_manager0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEY_MANAGER0 {
    #StructPack 8

    /**
     * Type: <b>GUID</b>
     * 
     * Uniquely identifies the Key Manager.
     */
    keyManagerKey : Guid

    /**
     * Type: [FWPM_DISPLAY_DATA0](/windows/desktop/api/fwptypes/ns-fwptypes-fwpm_display_data0)</b>
     * 
     * Contains annotations associated with the filter.
     */
    displayData : FWPM_DISPLAY_DATA0

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
     * <td width="40%"><a id="IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY"></a><a id="ipsec_key_manager_flag_dictate_key"></a><dl>
     * <dt><b>IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the TIA will be able to accept key notifications and also potentially dictate keys. If this flag is not set, the TIA can only accept key notifications and will not be able to dictate keys.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Type: <b>UINT8</b>
     * 
     * Time, in seconds, after which the <b>keyDictation</b> callback must return in order for registration to succeed. Set this field to <b>0</b> in order to use the default timeout (5 seconds).
     */
    keyDictationTimeoutHint : Int8

}
