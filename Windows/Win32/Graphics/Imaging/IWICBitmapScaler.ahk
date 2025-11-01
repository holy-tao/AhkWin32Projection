#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Represents a resized version of the input bitmap using a resampling or filtering algorithm.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapscaler
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapScaler extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapScaler
     * @type {Guid}
     */
    static IID => Guid("{00000302-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IWICBitmapSource} pISource 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Integer} mode 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pISource, uiWidth, uiHeight, mode) {
        result := ComCall(8, this, "ptr", pISource, "uint", uiWidth, "uint", uiHeight, "int", mode, "HRESULT")
        return result
    }
}
