#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_PROVIDER_ENUM_TEMPLATE0.ahk" { FWPM_PROVIDER_ENUM_TEMPLATE0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used to subscribe for change notifications. (FWPM_PROVIDER_SUBSCRIPTION0)
 * @remarks
 * Notifications are only dispatched for providers that match the template.
 * 
 * If
 *    the template is <b>NULL</b>, it matches all providers.
 * 
 * <b>FWPM_PROVIDER_SUBSCRIPTION0</b> is a specific implementation of FWPM_PROVIDER_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * [unique]
     * 
     *  Enumeration template for limiting the subscription.
     * 
     * See [FWPM_PROVIDER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_enum_template0) for more information.
     */
    enumTemplate : FWPM_PROVIDER_ENUM_TEMPLATE0.Ptr

    /**
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD"></a><a id="fwpm_subscription_flag_notify_on_add"></a><dl>
     * <dt><b>FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subscribe to provider add notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE"></a><a id="fwpm_subscription_flag_notify_on_delete"></a><dl>
     * <dt><b>FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subscribe to provider delete notifications.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Uniquely identifies the session.
     */
    sessionKey : Guid

}
