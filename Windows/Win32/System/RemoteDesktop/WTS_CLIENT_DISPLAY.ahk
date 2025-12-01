#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the display of a Remote Desktop Connection (RDC) client. (WTS_CLIENT_DISPLAY)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_client_display
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CLIENT_DISPLAY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Horizontal dimension, in pixels, of the client's display.
     * @type {Integer}
     */
    HorizontalResolution {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Vertical dimension, in pixels, of the client's display.
     * @type {Integer}
     */
    VerticalResolution {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
