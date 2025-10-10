#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FIXED.ahk
#Include .\POINTFX.ahk

/**
 * The TTPOLYGONHEADER structure specifies the starting position and type of a contour in a TrueType character outline.
 * @remarks
 * 
  * Each <b>TTPOLYGONHEADER</b> structure is followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> structures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-ttpolygonheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTPOLYGONHEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of bytes required by the <b>TTPOLYGONHEADER</b> structure and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> structure or structures required to describe the contour of the character.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of character outline returned. Currently, this value must be TT_POLYGON_TYPE.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The starting point of the contour in the character outline.
     * @type {POINTFX}
     */
    pfxStart{
        get {
            if(!this.HasProp("__pfxStart"))
                this.__pfxStart := POINTFX(this.ptr + 8)
            return this.__pfxStart
        }
    }
}
