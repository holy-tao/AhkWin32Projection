#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flags for the MFVideoAlphaBitmapParams structure.
 * @see https://learn.microsoft.com/windows/win32/api/evr9/ne-evr9-mfvideoalphabitmapflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoAlphaBitmapFlags extends Win32Enum{

    /**
     * Alpha-blend the entire DirectDraw surface.
     * 
     * If you are alpha-blending a DirectDraw surface, you can set this flag when you call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">IMFVideoMixerBitmap::SetAlphaBitmap</a>. If this flag is set, the mixer ignores the <b>rcSrc</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure. If this flag is absent, the <b>rcSrc</b> member specifies the source rectangle.
     * 
     * This flag cannot be used if you specify a GDI bitmap for alpha-blending. For a GDI bitmap, you must fill in the <b>rcSrc</b> member when you call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">SetAlphaBitmap</a>.
     * 
     * This flag does not apply to the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters">IMFVideoMixerBitmap::UpdateAlphaBitmapParameters</a> method.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_EntireDDS => 1

    /**
     * If this flag is set, the <b>clrSrcKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure specifies a color key for alpha-blending. If this flag is absent, the <b>clrSrcKey</b> member is ignored.
     * 
     * This flag is not valid if you are alpha-blending a Direct3D surface with per-pixel alpha (D3DFMT_A8R8G8B8). When the DirectDraw surface has per-pixel alpha, the pixel alpha values are used for the alpha-blending operation.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_SrcColorKey => 2

    /**
     * Update the source rectangle.
     * 
     * This flag applies to the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters">UpdateAlphaBitmapParameters</a> method. If this flag is set, the <b>rcSrc</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure updates the source rectangle. If this flag is absent, the <b>rcSrc</b> member is ignored. By setting this flag, you can animate the image by selecting different portions of the bitmap.
     * 
     * This flag does not apply to the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">SetAlphaBitmap</a> method.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_SrcRect => 4

    /**
     * If this flag is set, the <b>nrcDest</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure specifies a normalized rectangle for scaling the bitmap. If this flag is absent, the <b>nrcDest</b> member is ignored.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_DestRect => 8

    /**
     * If this flag is set, the <b>dwFilterMode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure specifies a Direct3D filtering mode. If this flag is absent, the <b>dwFilterMode</b> member is ignored.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_FilterMode => 16

    /**
     * If this flag is set, the <b>fAlpha</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure specifies an alpha value to apply to the entire image. If this flag is absent, the <b>fAlpha</b> member is ignored.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_Alpha => 32

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static MFVideoAlphaBitmap_BitMask => 63
}
