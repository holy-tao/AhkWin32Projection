#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\NORMALIZEDRECT.ahk

/**
 * The VMRALPHABITMAP structure is used in the VMR-7 filter's IVMRMixerBitmap methods when the application is providing a static alpha-blended bitmap to be displayed on the composited video frame.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmralphabitmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRALPHABITMAP extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Flags that instruct the mixer where to find the bitmap. The following values are defined.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VMRBITMAP_DISABLE"></a><a id="vmrbitmap_disable"></a><dl>
     * <dt><b>VMRBITMAP_DISABLE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable the bitmap. This flag cannot be combined with other flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VMRBITMAP_HDC"></a><a id="vmrbitmap_hdc"></a><dl>
     * <dt><b>VMRBITMAP_HDC</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtain the bitmap from the HDC. If this flag is set, the <b>hdc</b> member must specify a valid handle to a device context, and the <b>pDDS</b> member must be <b>NULL</b>.
     * 
     * If this flag is absent, the <b>pDDS</b> member must point to a valid DirectDraw surface, and the <b>hdc</b> member must be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VMRBITMAP_ENTIREDDS"></a><a id="vmrbitmap_entiredds"></a><dl>
     * <dt><b>VMRBITMAP_ENTIREDDS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Take the entire DirectDraw surface. When this flag is specified, <b>rSrc</b> is ignored. This flag cannot be combined with the <b>VMRBITMAP_HDC</b> flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VMRBITMAP_SRCCOLORKEY"></a><a id="vmrbitmap_srccolorkey"></a><dl>
     * <dt><b>VMRBITMAP_SRCCOLORKEY</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>clrSrcKey</b> value is valid and should be used when blending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VMRBITMAP_SRCRECT"></a><a id="vmrbitmap_srcrect"></a><dl>
     * <dt><b>VMRBITMAP_SRCRECT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <b>rSrc</b> rectangle is valid and specifies a sub-rectangle of the original app image to be blended. 
     * 
     * This flag is only valid for the  <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrmixerbitmap-updatealphabitmapparameters">IVMRMixerBitmap::UpdateAlphaBitmapParameters</a> method. For the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrmixerbitmap-setalphabitmap">IVMRMixerBitmap::SetAlphaBitmap</a> method, the <b>rSrc</b> member must refer to the entire bitmap.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The handle to the device context for the bitmap. Specify <b>NULL</b> if the bitmap is located in a DirectDraw surface.
     * @type {Pointer<Void>}
     */
    hdc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a DirectDraw surface that contains the bitmap. Specify <b>NULL</b> if the bitmap is to be obtained from a GDI device context. If a DirectDraw surface is specified, 
     *           the pixel format must be ARGB-32 or RGB-32. If the surface contains per-pixel alpha, do not set the VMRBITMAP_SRCCOLORKEY flag in <b>dwFlags</b>.
     * @type {Pointer<IDirectDrawSurface7>}
     */
    pDDS {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the source rectangle in either the GDI device context or the DirectDraw surface.
     * @type {RECT}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECT(this.ptr + 24)
            return this.__rSrc
        }
    }

    /**
     * Specifies the destination rectangle in composition space.
     * @type {NORMALIZEDRECT}
     */
    rDest{
        get {
            if(!this.HasProp("__rDest"))
                this.__rDest := NORMALIZEDRECT(this.ptr + 40)
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
     * Specifies the source color key.
     * @type {Integer}
     */
    clrSrcKey {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
