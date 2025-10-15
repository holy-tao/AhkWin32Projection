#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\MFVideoNormalizedRect.ahk

/**
 * Specifies how the enhanced video renderer (EVR) alpha-blends a bitmap with the video.
 * @see https://docs.microsoft.com/windows/win32/api//evr9/ns-evr9-mfvideoalphabitmapparams
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoAlphaBitmapParams extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/evr9/ne-evr9-mfvideoalphabitmapflags">MFVideoAlphaBitmapFlags</a> enumeration. These flags indicate which of the other structure members contain valid information.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Source color key. This member is used if the <b>dwFlags</b> member contains the MFVideoAlphaBitmap_SrcColorKey flag. Any pixels in the bitmap that match the color key are rendered as transparent pixels.
     * 
     * You cannot specify a color key if you are alpha-blending a Direct3D surface with per-pixel alpha (D3DFMT_A8R8G8B8).
     * @type {COLORREF}
     */
    clrSrcKey{
        get {
            if(!this.HasProp("__clrSrcKey"))
                this.__clrSrcKey := COLORREF(this.ptr + 4)
            return this.__clrSrcKey
        }
    }

    /**
     * Source rectangle. The source rectangle defines the region of the bitmap that is alpha-blended with the video. The source rectangle is given in pixels and is relative to the original bitmap.
     * 
     * If you are alpha-blending a GDI bitmap, you must fill in this structure when you call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">IMFVideoMixerBitmap::SetAlphaBitmap</a>.
     * 
     * If you are alpha-blending a Direct3D surface and the <b>dwFlags</b> member contains the MFVideoAlphaBitmap_EntireDDS flag, the <b>rcSrc</b> member is ignored. If the flag is absent, you must fill in the <b>rcSrc</b> member.
     * 
     * After setting the initiali bitmap, you can update the source rectangle by calling <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters">IMFVideoMixerBitmap::UpdateAlphaBitmapParameters</a>. To update the source rectangle, set the MFVideoAlphaBitmap_SrcColorKey flag in the <b>dwFlags</b> member.
     * 
     * The source rectangle cannot be an empty rectangle, and cannot exceed the bounds of the bitmap.
     * @type {RECT}
     */
    rcSrc{
        get {
            if(!this.HasProp("__rcSrc"))
                this.__rcSrc := RECT(this.ptr + 8)
            return this.__rcSrc
        }
    }

    /**
     * Destination rectangle. The destination rectangle defines the region of the composited video image that receives the alpha-blended bitmap. The destination rectangle is specified as a normalized rectangle using the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure.
     * 
     * This member is used if the <b>dwFlags</b> member contains the MFVideoAlphaBitmap_DestRect flag. Otherwise, the default destination rectangle is {0, 0, 1, 1}.
     * @type {MFVideoNormalizedRect}
     */
    nrcDest{
        get {
            if(!this.HasProp("__nrcDest"))
                this.__nrcDest := MFVideoNormalizedRect(this.ptr + 24)
            return this.__nrcDest
        }
    }

    /**
     * Alpha blending value. This member is used if the <b>dwFlags</b> member contains the MFVideoAlphaBitmap_Alpha flag. Otherwise, the default value is 1.0 (opaque). The valid range is 0.0 to 1.0, inclusive.
     * 
     * This value is applied to the entire bitmap image. To create transparent regions, use the <b>clrSrcKey</b> member or use a DirectDraw surface with per-pixel alpha.
     * @type {Float}
     */
    fAlpha {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Direct3D filtering mode to use when performing the alpha-blend operation. Specify the filter mode as a D3DTEXTUREFILTERTYPE value. For more information, see the Direct3D documentation.
     * 
     * This member is used if the <b>dwFlags</b> member contains the MFVideoAlphaBitmap_FilterMode flag. Otherwise, the default value is D3DTEXF_POINT.
     * 
     * Point filtering is particularly useful for images that contain text and will not be stretched.
     * @type {Integer}
     */
    dwFilterMode {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
