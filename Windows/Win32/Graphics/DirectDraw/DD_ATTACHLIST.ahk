#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_ATTACHLIST structure maintains a list of attached surfaces for Microsoft DirectDraw.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_attachlist
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_ATTACHLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Points to the next attached surface.
     * @type {Pointer<DD_ATTACHLIST>}
     */
    lpLink {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that contains the attached surface local object.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpAttached {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
