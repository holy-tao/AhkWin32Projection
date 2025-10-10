#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Color.ahk

/**
 * The ColorMap structure contains two Color objects. Several methods of the ImageAttributes class adjust image colors by using a color remap table, which is an array of ColorMap structures.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolormatrix/ns-gdipluscolormatrix-colormap
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorMap extends Win32Struct
{
    static sizeof => 1200

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdipluscolor/nl-gdipluscolor-color">Color</a></b>
     * 
     * The original color.
     * @type {Color}
     */
    oldColor{
        get {
            if(!this.HasProp("__oldColor"))
                this.__oldColor := Color(this.ptr + 0)
            return this.__oldColor
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdipluscolor/nl-gdipluscolor-color">Color</a></b>
     * 
     * The new color.
     * @type {Color}
     */
    newColor{
        get {
            if(!this.HasProp("__newColor"))
                this.__newColor := Color(this.ptr + 600)
            return this.__newColor
        }
    }
}
