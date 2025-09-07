#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to subscribe for change notifications.
 * @remarks
 * Notifications are only dispatched for filters that match the template.
  * 
  * If
  *    the template is <b>NULL</b>, it matches all filters.
  * 
  * <b>FWPM_FILTER_SUBSCRIPTION0</b> is a specific implementation of FWPM_FILTER_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FILTER_SUBSCRIPTION0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A  [FWPM_FILTER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_enum_template0) structure used to limit the subscription.
     * @type {Pointer<FWPM_FILTER_ENUM_TEMPLATE0>}
     */
    enumTemplate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The notification type(s) received by the subscription.
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
     * Subscribe to filter add notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE"></a><a id="fwpm_subscription_flag_notify_on_delete"></a><dl>
     * <dt><b>FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subscribe to filter delete notifications.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Uniquely identifies this session.
     * @type {Pointer<Guid>}
     */
    sessionKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
