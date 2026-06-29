#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapInterpolationMode.ahk" { WICBitmapInterpolationMode }

/**
 * Represents a resized version of the input bitmap using a resampling or filtering algorithm.
 * @remarks
 * Images can be scaled to larger sizes; however, even with sophisticated scaling algorithms, there is only so much information in the image and artifacts tend to worsen the more you scale up.
 * 
 * The scaler will reapply the resampling algorithm every time <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> is called. 
 *             If the scaled image is to be animated, the scaled image should be created once and cached in a new bitmap, after which the <b>IWICBitmapScaler</b> may be released. 
 *             In this way the scaling algorithm - which may be computationally expensive relative to drawing - is performed only once and the result displayed many times.
 *          
 * 
 * The scaler is optimized to use the minimum amount of memory required to scale the image correctly. 
 *             The scaler may be used to produce parts of the image incrementally (banding) by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> with different rectangles representing the output bands of the image. 
 *             Resampling typically requires overlapping rectangles from the source image and thus may need to request the same pixels from the source bitmap multiple times. 
 *             Requesting scanlines out-of-order from some image decoders can have a significant performance penalty. 
 *             Because of this reason, the scaler is optimized to handle consecutive horizontal bands of scanlines (rectangle width equal to the bitmap width). 
 *             In this case the accumulator from the previous vertically adjacent rectangle is re-used to avoid duplicate scanline requests from the source. 
 *             This implies that banded output from the scaler may have better performance if the bands are requested sequentially. 
 *             Of course if the scaler is simply used to produce a single rectangle output, this concern is eliminated because the scaler will internally request scanlines in the correct order.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapscaler
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapScaler extends IWICBitmapSource {
    /**
     * The interface identifier for IWICBitmapScaler
     * @type {Guid}
     */
    static IID := Guid("{00000302-a8f2-4877-ba0a-fd2b6645fb94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapScaler interfaces
    */
    struct Vtbl extends IWICBitmapSource.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapScaler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the bitmap scaler with the provided parameters.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapscaler">IWICBitmapScaler</a> can't be initialized multiple times. For example, when scaling every frame in a multi-frame image, a new <b>IWICBitmapScaler</b> must be created and initialized for each frame.
     * @param {IWICBitmapSource} pISource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The input bitmap source.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The destination width.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The destination height.
     * @param {WICBitmapInterpolationMode} _mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapinterpolationmode">WICBitmapInterpolationMode</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapinterpolationmode">WICBitmapInterpolationMode</a> to use when scaling.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapscaler-initialize
     */
    Initialize(pISource, uiWidth, uiHeight, _mode) {
        result := ComCall(8, this, "ptr", pISource, "uint", uiWidth, "uint", uiHeight, WICBitmapInterpolationMode, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICBitmapScaler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
