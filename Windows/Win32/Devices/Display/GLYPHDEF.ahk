#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GLYPHDEF union identifies individual glyphs and provides either a pointer to a GLYPHBITS structure or a pointer to a PATHOBJ structure.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-glyphdef
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GLYPHDEF extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * If <b>pgb</b> is defined, this member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphbits">GLYPHBITS</a> structure. The driver can use the bitmap bits stored in this structure to form the associated glyph on its surface.
     * @type {Pointer<GLYPHBITS>}
     */
    pgb {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * If <b>ppo</b> is defined, this member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure the driver can examine to extract the path describing the associated glyph.
     * @type {Pointer<PATHOBJ>}
     */
    ppo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
