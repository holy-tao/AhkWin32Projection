#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The GLYPHPOS structure is used by GDI to provide a graphics driver with a glyph's description and position.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-glyphpos
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GLYPHPOS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Handle to the glyph.
     * @type {Integer}
     */
    hg {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdef">GLYPHDEF</a> union.
     * @type {Pointer<GLYPHDEF>}
     */
    pgdf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the coordinates of the point in device space where the character origin of the glyph should be placed.
     * @type {POINTL}
     */
    ptl{
        get {
            if(!this.HasProp("__ptl"))
                this.__ptl := POINTL(this.ptr + 16)
            return this.__ptl
        }
    }
}
