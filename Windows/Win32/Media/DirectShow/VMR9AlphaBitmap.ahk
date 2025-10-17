#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\VMR9NormalizedRect.ahk

/**
 * The VMR9AlphaBitmap structure is used with the IVMRMixerBitmap9 interface when an application provides a static bitmap for alpha blending with the video frame.
 * @remarks
 * 
  * To get the HDC for a GDI bitmap, do the following:
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a> to get the device context for the application's video window.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatibledc">CreateCompatibleDC</a> to create a compatible device context.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-selectobject">SelectObject</a> to select the bitmap into the device context obtained in the previous step.</li>
  * </ol>
  * When you are done, release the device context by calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletedc">DeleteDC</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9alphabitmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9AlphaBitmap extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9alphabitmapflags">VMR9AlphaBitmapFlags</a> enumeration type.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to the GDI device context (HDC) for the bitmap. If this member contains a non-<b>NULL</b> value, set <b>pDDS</b> to <b>NULL</b> and set the <b>VMR9AlphaBitmap_hDC</b> flag in the <b>dwFlags</b> member. The device context is not compatible with GDI+.
     * @type {HDC}
     */
    hdc{
        get {
            if(!this.HasProp("__hdc"))
                this.__hdc := HDC(8, this)
            return this.__hdc
        }
    }

    /**
     * Pointer to the <b>IDirect3DSurface9</b> interface of a Direct3D surface that contains the bitmap. If this member contains a valid pointer, set the <b>hdc</b> member to <b>NULL</b>. The surface format must be <b>D3DFMT_X8R8G8B8</b> (32-bit RGB) or <b>D3DFMT_A8R8G8B8</b> (32-bit RGB with per-pixel alpha). The surface must be allocated from the <b>D3DPOOL_SYSTEMMEM</b> pool.
     * @type {Pointer<IDirect3DSurface9>}
     */
    pDDS {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the rectangle to copy from the source image. This rectangle is specified relative to the GDI device context or the DirectDraw surface.
     * 
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrmixerbitmap9-setalphabitmap">IVMRMixerBitmap9::SetAlphaBitmap</a>, the source rectangle must be valid if a GDI bitmap is specified in the <b>hdc</b> member. On the other hand, if a Direct3D surface is specified in the <b>pDDS</b> member, then you can either set <b>rSrc</b> to a valid rectangle, or use the entire surface by setting the VMR9AlphaBitmap_EntireDDS flag in <b>dwFlags</b>.
     * 
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrmixerbitmap9-updatealphabitmapparameters">IVMRMixerBitmap9::UpdateAlphaBitmapParameters</a>, <b>rSrc</b> is always optional, and is used if <b>dwFlags</b> contains the VMR9AlphaBitmap_SrcRect flag.
     * @type {RECT}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECT(24, this)
            return this.__rSrc
        }
    }

    /**
     * Specifies the destination rectangle in composition space.
     * @type {VMR9NormalizedRect}
     */
    rDest{
        get {
            if(!this.HasProp("__rDest"))
                this.__rDest := VMR9NormalizedRect(40, this)
            return this.__rDest
        }
    }

    /**
     * Specifies the alpha blending value; must be a value from 0.0 to 1.0 (inclusive).
     * @type {Float}
     */
    fAlpha {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Specifies the source color key. This value is used if the <b>dwFlags</b> member contains the <b>VMR9AlphaBitmap_SrcColorKey</b>. A color key cannot be used with a Direct3D surface that contains per-pixel alpha.
     * @type {COLORREF}
     */
    clrSrcKey {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * One of the following flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9mixerprefs">VMR9MixerPrefs</a> enumeration, or zero to specify no filtering.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MixerPref9_BiLinearFiltering"></a><a id="mixerpref9_bilinearfiltering"></a><a id="MIXERPREF9_BILINEARFILTERING"></a><dl>
     * <dt><b>MixerPref9_BiLinearFiltering</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bilinear interpolation filtering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MixerPref9_PointFiltering"></a><a id="mixerpref9_pointfiltering"></a><a id="MIXERPREF9_POINTFILTERING"></a><dl>
     * <dt><b>MixerPref9_PointFiltering</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point filtering. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MixerPref9_AnisotropicFiltering"></a><a id="mixerpref9_anisotropicfiltering"></a><a id="MIXERPREF9_ANISOTROPICFILTERING"></a><dl>
     * <dt><b>MixerPref9_AnisotropicFiltering</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Anisotropic filtering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_MixerPref9_PyramidalQuadFiltering"></a><a id="_mixerpref9_pyramidalquadfiltering"></a><a id="_MIXERPREF9_PYRAMIDALQUADFILTERING"></a><dl>
     * <dt><b> MixerPref9_PyramidalQuadFiltering</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Four-sample tent filtering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MixerPref9_GaussianQuadFiltering"></a><a id="mixerpref9_gaussianquadfiltering"></a><a id="MIXERPREF9_GAUSSIANQUADFILTERING"></a><dl>
     * <dt><b>MixerPref9_GaussianQuadFiltering</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Four-sample Gaussian filtering.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This structure member is used only if the <b>dwFlags</b> member contains the <b>VMR9AlphaBitmap_FilterMode</b> flag. 
     * 
     * Point filtering is particularly useful for images that contain text and do not need to be stretched prior to mixing.
     * @type {Integer}
     */
    dwFilterMode {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
