#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_MONITOR_PARMS structure contains parameters for the MCI_MONITOR command.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_monitor_parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_DGV_MONITOR_PARMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * One of the following flags for the monitor source:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_DGV_MONITOR_FILE"></a><a id="mci_dgv_monitor_file"></a><dl>
     * <dt><b>MCI_DGV_MONITOR_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The workspace is the presentation source. (This is the default source.) If this flag is used during recording, the recording pauses. If the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-monitor">MCI_MONITOR</a> command changes the presentation source, recording or playing stops and the current position is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-status">MCI_STATUS</a> command for the start position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_DGV_MONITOR_INPUT"></a><a id="mci_dgv_monitor_input"></a><dl>
     * <dt><b>MCI_DGV_MONITOR_INPUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The external input is the presentation source. Playback is paused before the input is selected. If the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-setvideo">MCI_SETVIDEO</a> command has been enabled using the MCI_SET_ON flag, this flag displays a default hidden window. Device drivers might limit what other device instances can do while monitoring input.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * One of the following constants for the type of monitoring:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_DGV_METHOD_DIRECT"></a><a id="mci_dgv_method_direct"></a><dl>
     * <dt><b>MCI_DGV_METHOD_DIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device should be configured for optimum display quality during monitoring. Direct monitoring might be incompatible with motion-video recording.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_DGV_METHOD_POST"></a><a id="mci_dgv_method_post"></a><dl>
     * <dt><b>MCI_DGV_METHOD_POST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device should show the external input after compression. Post monitoring supports motion-video recording.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MCI_DGV_METHOD_PRE"></a><a id="mci_dgv_method_pre"></a><dl>
     * <dt><b>MCI_DGV_METHOD_PRE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device should show the external input prior to compression.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwMethod {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
