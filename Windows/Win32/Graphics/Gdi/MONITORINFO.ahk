#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The MONITORINFO structure contains information about a display monitor.The GetMonitorInfo function stores information in a MONITORINFO structure or a MONITORINFOEX structure.The MONITORINFO structure is a subset of the MONITORINFOEX structure.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-monitorinfo
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MONITORINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The size of the structure, in bytes.
     * 
     * Set this member to <c>sizeof ( MONITORINFO )</c> before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmonitorinfoa">GetMonitorInfo</a> function. Doing so lets the function determine the type of structure you are passing to it.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the display monitor rectangle, expressed in virtual-screen coordinates. Note that if the monitor is not the primary display monitor, some of the rectangle's coordinates may be negative values.
     * @type {RECT}
     */
    rcMonitor{
        get {
            if(!this.HasProp("__rcMonitor"))
                this.__rcMonitor := RECT(4, this)
            return this.__rcMonitor
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the work area rectangle of the display monitor, expressed in virtual-screen coordinates. Note that if the monitor is not the primary display monitor, some of the rectangle's coordinates may be negative values.
     * @type {RECT}
     */
    rcWork{
        get {
            if(!this.HasProp("__rcWork"))
                this.__rcWork := RECT(20, this)
            return this.__rcWork
        }
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
