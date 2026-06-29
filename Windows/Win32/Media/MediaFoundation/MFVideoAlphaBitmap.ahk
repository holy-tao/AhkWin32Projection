#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFVideoAlphaBitmapParams.ahk" { MFVideoAlphaBitmapParams }
#Import ".\MFVideoNormalizedRect.ahk" { MFVideoNormalizedRect }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies a bitmap for the enhanced video renderer (EVR) to alpha-blend with the video.
 * @remarks
 * To specify a GDI bitmap, create a device context and call <b>SelectObject</b> to select the bitmap into the DC. Then set the <b>hdc</b> member of the structure equal to the handle to the DC and set the <b>GetBitmapFromDC</b> member to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/evr9/ns-evr9-mfvideoalphabitmap
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoAlphaBitmap {
    #StructPack 8


    struct _bitmap {
        hdc : HDC

        static __New() {
            DefineProp(this.Prototype, 'pDDS', { type: IDirect3DSurface9, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * If <b>TRUE</b>, the <b>hdc</b> member is used. Otherwise, the <b>pDDs</b> member is used.
     */
    GetBitmapFromDC : BOOL

    /**
     * A union that contains the following members.
     */
    bitmap : MFVideoAlphaBitmap._bitmap

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure that specifies the parameters for the alpha-blending operation.
     */
    params : MFVideoAlphaBitmapParams

}
