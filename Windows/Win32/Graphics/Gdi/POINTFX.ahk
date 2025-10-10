#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FIXED.ahk

/**
 * The POINTFX structure contains the coordinates of points that describe the outline of a character in a TrueType font.
 * @remarks
 * 
  * The <b>POINTFX</b> structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolygonheader">TTPOLYGONHEADER</a> structures. Values in the <b>POINTFX</b> structure are specified in device units.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-pointfx
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class POINTFX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x-component of a point on the outline of a TrueType character.
     * @type {FIXED}
     */
    x{
        get {
            if(!this.HasProp("__x"))
                this.__x := FIXED(this.ptr + 0)
            return this.__x
        }
    }

    /**
     * The y-component of a point on the outline of a TrueType character.
     * @type {FIXED}
     */
    y{
        get {
            if(!this.HasProp("__y"))
                this.__y := FIXED(this.ptr + 4)
            return this.__y
        }
    }
}
