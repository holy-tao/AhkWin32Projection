#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_SURFACE_INT structure contains the DirectDrawSurface object's interface information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_int
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SURFACE_INT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes a unique surface object.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpLcl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
