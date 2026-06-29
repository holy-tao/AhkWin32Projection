#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapTransformOptions.ahk" { WICBitmapTransformOptions }

/**
 * Exposes methods that produce a flipped (horizontal or vertical) and/or rotated (by 90 degree increments) bitmap source. The flip is done before the rotation.
 * @remarks
 * IWICBitmapFipRotator requests data on a per-pixel basis, while WIC codecs provide data on a per-scanline basis. This causes the fliprotator object to exhibit n² behavior if there is no buffering.  This occurs because each pixel in the transformed image requires an entire scanline to be decoded in the file. It is recommended that you buffer the image using <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>, or flip/rotate the image using Direct2D.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapfliprotator
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapFlipRotator extends IWICBitmapSource {
    /**
     * The interface identifier for IWICBitmapFlipRotator
     * @type {Guid}
     */
    static IID := Guid("{5009834f-2d6a-41ce-9e1b-17c5aff7a782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapFlipRotator interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapFlipRotator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the bitmap flip rotator with the provided parameters.
     * @param {IWICBitmapSource} pISource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The input bitmap source.
     * @param {WICBitmapTransformOptions} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmaptransformoptions">WICBitmapTransformOptions</a> to flip or rotate the image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapfliprotator-initialize
     */
    Initialize(pISource, options) {
        result := ComCall(8, this, "ptr", pISource, WICBitmapTransformOptions, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICBitmapFlipRotator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
