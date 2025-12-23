#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9AlphaBitmapFlags enumeration type defines the possible values for the dwFlags member of the VMR9AlphaBitmap structure.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9alphabitmapflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9AlphaBitmapFlags extends Win32Enum{

    /**
     * Disable the alpha bitmap. This flag cannot be combined with any other flags.
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_Disable => 1

    /**
     * The bitmap is specified as a GDI device context (HDC) in the <b>hdc</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9alphabitmap">VMR9AlphaBitmap</a> structure. If this flag is not present, the bitmap is specified as a Direct3D <b>IDirect3DSurface9</b> pointer in the <b>pDDS</b> member of the structure.
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_hDC => 2

    /**
     * Use the entire Direct3D surface. The <b>rSrc</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9alphabitmap">VMR9AlphaBitmap</a> structure is ignored. This flag cannot be combined with the VMR9AlphaBitmap_hDC flag.
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_EntireDDS => 4

    /**
     * Indicates that the <b>srcClrKey</b> member is valid and should be used when blending. This flag cannot be used with a Direct3D surface that contains per-pixel alpha (D3DFMT_A8R8G8B8 format).
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_SrcColorKey => 8

    /**
     * Indicates that the <b>rSrc</b> member is valid and specifies a sub-rectangle of the original image to be blended. This flag is only valid for the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrmixerbitmap9-updatealphabitmapparameters">IVMRMixerBitmap9::UpdateAlphaBitmapParameters</a> method.
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_SrcRect => 16

    /**
     * Indicates that the <b>dwFilterMode</b> member is valid and should be used to override the VMR filter's default filtering method.
     * @type {Integer (Int32)}
     */
    static VMR9AlphaBitmap_FilterMode => 32
}
