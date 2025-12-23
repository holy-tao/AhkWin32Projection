#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_CLIPPER_GLOBAL structure contains the global DirectDrawClipper data that can be shared between object instances.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_clipper_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CLIPPER_GLOBAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
