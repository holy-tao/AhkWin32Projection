#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_PALETTE_LOCAL structure contains palette-related data that is unique to an individual palette object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_palette_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_PALETTE_LOCAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    dwReserved0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for use by the display driver
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
