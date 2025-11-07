#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains client window coordinates.
 * @remarks
 * 
 * This structure is used by the Remote Desktop Services service to redraw the client window.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_small_rect
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_SMALL_RECT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Specifies the upper left x-coordinate.
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Specifies the upper left y-coordinate.
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Specifies the lower right x-coordinate.
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * Specifies the lower right y-coordinate.
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }
}
