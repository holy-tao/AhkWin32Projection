#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a window's maximized size and position and its minimum and maximum tracking size.
 * @remarks
 * For systems with multiple monitors, the <b>ptMaxSize</b> and <b>ptMaxPosition</b> members describe the maximized size and position of the window on the primary monitor, even if the window ultimately maximizes onto a secondary monitor. In that case, the window manager adjusts these values to compensate for differences between the primary monitor and the monitor that displays the window. Thus, if the user leaves <b>ptMaxSize</b> untouched, a window on a monitor larger than the primary monitor maximizes to the size of the larger monitor.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-minmaxinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MINMAXINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Reserved; do not use.
     * @type {POINT}
     */
    ptReserved{
        get {
            if(!this.HasProp("__ptReserved"))
                this.__ptReserved := POINT(0, this)
            return this.__ptReserved
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The maximized width (<b>x</b> member) and the maximized height (<b>y</b> member) of the window. For top-level windows, this value is based on the width of the primary monitor.
     * @type {POINT}
     */
    ptMaxSize{
        get {
            if(!this.HasProp("__ptMaxSize"))
                this.__ptMaxSize := POINT(8, this)
            return this.__ptMaxSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The position of the left side of the maximized window (<b>x</b> member) and the position of the top of the maximized window (<b>y</b> member). For top-level windows, this value is based on the position of the primary monitor.
     * @type {POINT}
     */
    ptMaxPosition{
        get {
            if(!this.HasProp("__ptMaxPosition"))
                this.__ptMaxPosition := POINT(16, this)
            return this.__ptMaxPosition
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The minimum tracking width (<b>x</b> member) and the minimum tracking height (<b>y</b> member) of the window. This value can be obtained programmatically from the system metrics <b>SM_CXMINTRACK</b> and <b>SM_CYMINTRACK</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> function).
     * @type {POINT}
     */
    ptMinTrackSize{
        get {
            if(!this.HasProp("__ptMinTrackSize"))
                this.__ptMinTrackSize := POINT(24, this)
            return this.__ptMinTrackSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The maximum tracking width (<b>x</b> member) and the maximum tracking height (<b>y</b> member) of the window. This value is based on the size of the virtual screen and can be obtained programmatically from the system metrics <b>SM_CXMAXTRACK</b> and <b>SM_CYMAXTRACK</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> function).
     * @type {POINT}
     */
    ptMaxTrackSize{
        get {
            if(!this.HasProp("__ptMaxTrackSize"))
                this.__ptMaxTrackSize := POINT(32, this)
            return this.__ptMaxTrackSize
        }
    }
}
