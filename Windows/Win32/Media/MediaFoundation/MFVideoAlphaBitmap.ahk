#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\COLORREF.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\MFVideoNormalizedRect.ahk
#Include .\MFVideoAlphaBitmapParams.ahk

/**
 * Specifies a bitmap for the enhanced video renderer (EVR) to alpha-blend with the video.
 * @remarks
 * 
  * To specify a GDI bitmap, create a device context and call <b>SelectObject</b> to select the bitmap into the DC. Then set the <b>hdc</b> member of the structure equal to the handle to the DC and set the <b>GetBitmapFromDC</b> member to <b>TRUE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evr9/ns-evr9-mfvideoalphabitmap
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoAlphaBitmap extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * If <b>TRUE</b>, the <b>hdc</b> member is used. Otherwise, the <b>pDDs</b> member is used.
     * @type {BOOL}
     */
    GetBitmapFromDC{
        get {
            if(!this.HasProp("__GetBitmapFromDC"))
                this.__GetBitmapFromDC := BOOL(this.ptr + 0)
            return this.__GetBitmapFromDC
        }
    }

    /**
     * @type {HDC}
     */
    hdc{
        get {
            if(!this.HasProp("__hdc"))
                this.__hdc := HDC(this.ptr + 8)
            return this.__hdc
        }
    }

    /**
     * @type {Pointer<IDirect3DSurface9>}
     */
    pDDS {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure that specifies the parameters for the alpha-blending operation.
     * @type {MFVideoAlphaBitmapParams}
     */
    params{
        get {
            if(!this.HasProp("__params"))
                this.__params := MFVideoAlphaBitmapParams(this.ptr + 16)
            return this.__params
        }
    }
}
