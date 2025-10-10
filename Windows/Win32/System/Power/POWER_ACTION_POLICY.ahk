#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to set the system power state.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-power_action_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_ACTION_POLICY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The requested system power state. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-power_action">POWER_ACTION</a> enumeration type values.
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A flag that controls how to switch the power state. This member can be one or more of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_CRITICAL"></a><a id="power_action_critical"></a><dl>
     * <dt><b>POWER_ACTION_CRITICAL</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a critical suspension.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_DISABLE_WAKES"></a><a id="power_action_disable_wakes"></a><dl>
     * <dt><b>POWER_ACTION_DISABLE_WAKES</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables all wake events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_LIGHTEST_FIRST"></a><a id="power_action_lightest_first"></a><dl>
     * <dt><b>POWER_ACTION_LIGHTEST_FIRST</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the first lightest available sleep state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_LOCK_CONSOLE"></a><a id="power_action_lock_console"></a><dl>
     * <dt><b>POWER_ACTION_LOCK_CONSOLE</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requires entry of the system password upon resume from one of the system standby states.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_OVERRIDE_APPS"></a><a id="power_action_override_apps"></a><dl>
     * <dt><b>POWER_ACTION_OVERRIDE_APPS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Has no effect.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_QUERY_ALLOWED"></a><a id="power_action_query_allowed"></a><dl>
     * <dt><b>POWER_ACTION_QUERY_ALLOWED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Has no effect.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ACTION_UI_ALLOWED"></a><a id="power_action_ui_allowed"></a><dl>
     * <dt><b>POWER_ACTION_UI_ALLOWED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applications can prompt the user for directions on how to prepare for suspension. Sets bit 0 in the 
     *         <i>Flags</i> parameter passed in the <i>lParam</i> parameter of 
     *         <a href="https://docs.microsoft.com/windows/desktop/Power/wm-powerbroadcast">WM_POWERBROADCAST</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    EventCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
