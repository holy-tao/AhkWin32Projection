#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A BlurParams structure contains members that specify the nature of a Gaussian blur.
 * @remarks
 * 
 * One of the two <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-applyeffect(inbitmap_inint_ineffect_inrect_outrect_outbitmap)">Bitmap::ApplyEffect</a> methods blurs a bitmap in place. That particular <a href="https://docs.microsoft.com/previous-versions/ms536321(v=vs.85)">Bitmap::ApplyEffect</a> method ignores the <b>expandEdge</b> parameter.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-blurparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class BlurParams extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>float</b>
     * 
     * Real number that specifies the blur radius (the radius of the Gaussian convolution kernel) in pixels. The radius must be in the range 0 through 255. As the radius increases, the resulting bitmap becomes more blurry.
     * @type {Float}
     */
    radius {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Boolean value that specifies whether the bitmap expands by an amount equal to the blur radius. If <b>TRUE</b>, the bitmap expands by an amount equal to the radius so that it can have soft edges. If <b>FALSE</b>, the bitmap remains the same size and the soft edges are clipped.
     * @type {BOOL}
     */
    expandEdge {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
