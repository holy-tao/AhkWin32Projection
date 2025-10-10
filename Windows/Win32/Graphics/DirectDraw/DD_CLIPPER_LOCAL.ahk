#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_CLIPPER_LOCAL structure contains local data for each individual DirectDrawClipper object.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_clipper_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CLIPPER_LOCAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Is reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
