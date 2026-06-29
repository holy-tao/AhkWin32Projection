#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The MONITORINFO structure contains information about a display monitor.The GetMonitorInfo function stores information in a MONITORINFO structure or a MONITORINFOEX structure.The MONITORINFO structure is a subset of the MONITORINFOEX structure.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-monitorinfo
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MONITORINFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     * 
     * Set this member to <c>sizeof ( MONITORINFO )</c> before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmonitorinfoa">GetMonitorInfo</a> function. Doing so lets the function determine the type of structure you are passing to it.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the display monitor rectangle, expressed in virtual-screen coordinates. Note that if the monitor is not the primary display monitor, some of the rectangle's coordinates may be negative values.
     */
    rcMonitor : RECT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the work area rectangle of the display monitor, expressed in virtual-screen coordinates. Note that if the monitor is not the primary display monitor, some of the rectangle's coordinates may be negative values.
     */
    rcWork : RECT

    /**
     * A set of flags that represent attributes of the display monitor.
     * 
     * The following flag is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>MONITORINFOF_PRIMARY</td>
     * <td>This is the primary display monitor.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
