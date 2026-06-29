#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_FILTER_CONDITION0.ahk" { FWPM_FILTER_CONDITION0 }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Used for enumerating net events.
 * @remarks
 * <b>FWPM_NET_EVENT_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_NET_EVENT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the start time of the period to be checked for net events.
     */
    startTime : FILETIME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the end time of the period to be checked for net events. It must be greater than or equal to <b>startTime</b>.
     */
    endTime : FILETIME

    /**
     * Indicates the number of filter conditions in the <b>filterCondition</b> member.  If this field is 0, all events will be returned.
     */
    numFilterConditions : UInt32

    /**
     * An array of [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0) structures that contain distinct filter conditions (duplicated filter conditions will generate an error). All conditions must be true for the action to be
     *    performed. In other words, the conditions are AND'ed together. If no
     *    conditions are specified, the action is always performed. 
     * 
     * 
     * Supported filtering conditions.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_IP_PROTOCOL"></a><a id="fwpm_condition_ip_protocol"></a><dl>
     * <dt><b>FWPM_CONDITION_IP_PROTOCOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP protocol number, as specified in RFC 1700.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_IP_LOCAL_ADDRESS"></a><a id="fwpm_condition_ip_local_address"></a><dl>
     * <dt><b>FWPM_CONDITION_IP_LOCAL_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local IP address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_IP_REMOTE_ADDRESS"></a><a id="fwpm_condition_ip_remote_address"></a><dl>
     * <dt><b>FWPM_CONDITION_IP_REMOTE_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote IP address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_IP_LOCAL_PORT"></a><a id="fwpm_condition_ip_local_port"></a><dl>
     * <dt><b>FWPM_CONDITION_IP_LOCAL_PORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local transport protocol port number. For ICMP, the message type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_IP_REMOTE_PORT"></a><a id="fwpm_condition_ip_remote_port"></a><dl>
     * <dt><b>FWPM_CONDITION_IP_REMOTE_PORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote transport protocol port number. For ICMP, the  message code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_SCOPE_ID"></a><a id="fwpm_condition_scope_id"></a><dl>
     * <dt><b>FWPM_CONDITION_SCOPE_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface IPv6 scope identifier. Reserved for internal use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_ALE_APP_ID"></a><a id="fwpm_condition_ale_app_id"></a><dl>
     * <dt><b>FWPM_CONDITION_ALE_APP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The full path of the application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONDITION_ALE_USER_ID"></a><a id="fwpm_condition_ale_user_id"></a><dl>
     * <dt><b>FWPM_CONDITION_ALE_USER_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The identification of the local user.
     * 
     * </td>
     * </tr>
     * </table>
     */
    filterCondition : FWPM_FILTER_CONDITION0.Ptr

}
