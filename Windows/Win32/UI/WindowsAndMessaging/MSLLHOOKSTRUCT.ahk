#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Contains information about a low-level mouse input event.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-msllhookstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MSLLHOOKSTRUCT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The x- and y-coordinates of the cursor, in <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">per-monitor-aware</a> screen coordinates.
     */
    pt : POINT

    /**
     * Type: <b>DWORD</b>
     * 
     * If the message is <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousewheel">WM_MOUSEWHEEL</a>, the high-order word of this member is the wheel delta. The low-order word is reserved. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as <b>WHEEL_DELTA</b>, which is 120.
     */
    mouseData : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The event-injected flags. An application can use the following values to test the flags. Testing LLMHF_INJECTED (bit 0) will tell you whether the event was injected. If it was, then testing LLMHF_LOWER_IL_INJECTED (bit 1) will tell you whether or not the event was injected from a process running at lower integrity level.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLMHF_INJECTED"></a><a id="llmhf_injected"></a><dl>
     * <dt><b>LLMHF_INJECTED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the event-injected (from any process) flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLMHF_LOWER_IL_INJECTED"></a><a id="llmhf_lower_il_injected"></a><dl>
     * <dt><b>LLMHF_LOWER_IL_INJECTED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the event-injected (from a process running at lower integrity level) flag.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp for this message.
     */
    time : UInt32

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with the message.
     */
    dwExtraInfo : IntPtr

}
