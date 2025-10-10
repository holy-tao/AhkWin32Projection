#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the action taken if all the filter conditions are true.
 * @remarks
 * 
  * <b>FWPM_ACTION0</b> is a specific implementation of FWPM_ACTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_action0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_ACTION0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Action type as specified by <b>FWP_ACTION_TYPE</b> which maps to a <b>UINT32</b>.
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_BLOCK"></a><a id="fwp_action_block"></a><dl>
     * <dt><b>FWP_ACTION_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Block the traffic. 
     * 
     * 0x00000001 | FWP_ACTION_FLAG_TERMINATING
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_PERMIT"></a><a id="fwp_action_permit"></a><dl>
     * <dt><b>FWP_ACTION_PERMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Permit the traffic.
     * 
     * 0x00000002 | FWP_ACTION_FLAG_TERMINATING
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_CALLOUT_TERMINATING"></a><a id="fwp_action_callout_terminating"></a><dl>
     * <dt><b>FWP_ACTION_CALLOUT_TERMINATING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invoke a callout that always returns block or permit.
     * 
     * 0x00000003 | FWP_ACTION_FLAG_CALLOUT | FWP_ACTION_FLAG_TERMINATING
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_CALLOUT_INSPECTION"></a><a id="fwp_action_callout_inspection"></a><dl>
     * <dt><b>FWP_ACTION_CALLOUT_INSPECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invoke a callout that never returns block or permit.
     * 
     * 0x00000004 | FWP_ACTION_FLAG_CALLOUT | FWP_ACTION_FLAG_NON_TERMINATING
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWP_ACTION_CALLOUT_UNKNOWN"></a><a id="fwp_action_callout_unknown"></a><dl>
     * <dt><b>FWP_ACTION_CALLOUT_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invoke a callout that may return block or permit.
     * 
     * 0x00000005 | FWP_ACTION_FLAG_CALLOUT
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    filterType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    calloutKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
