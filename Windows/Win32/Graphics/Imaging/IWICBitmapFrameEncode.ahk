#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an encoder's individual image frames.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapframeencode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapFrameEncode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapFrameEncode
     * @type {Guid}
     */
    static IID => Guid("{00000105-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetSize", "SetResolution", "SetPixelFormat", "SetColorContexts", "SetPalette", "SetThumbnail", "WritePixels", "WriteSource", "Commit", "GetMetadataQueryWriter"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IPropertyBag2} pIEncoderOptions 
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
    Initialize(pIEncoderOptions) {
        result := ComCall(3, this, "ptr", pIEncoderOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize
     */
    SetSize(uiWidth, uiHeight) {
        result := ComCall(4, this, "uint", uiWidth, "uint", uiHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setresolution
     */
    SetResolution(dpiX, dpiY) {
        result := ComCall(5, this, "double", dpiX, "double", dpiY, "HRESULT")
        return result
    }

    /**
     * The SetPixelFormat function sets the pixel format of the specified device context to the format specified by the iPixelFormat index.
     * @param {Pointer<Guid>} pPixelFormat 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpixelformat
     */
    SetPixelFormat(pPixelFormat) {
        result := ComCall(6, this, "ptr", pPixelFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCount 
     * @param {Pointer<IWICColorContext>} ppIColorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setcolorcontexts
     */
    SetColorContexts(cCount, ppIColorContext) {
        result := ComCall(7, this, "uint", cCount, "ptr*", ppIColorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICPalette} pIPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(8, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pIThumbnail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setthumbnail
     */
    SetThumbnail(pIThumbnail) {
        result := ComCall(9, this, "ptr", pIThumbnail, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lineCount 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @param {Pointer<Integer>} pbPixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels
     */
    WritePixels(lineCount, cbStride, cbBufferSize, pbPixels) {
        pbPixelsMarshal := pbPixels is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", lineCount, "uint", cbStride, "uint", cbBufferSize, pbPixelsMarshal, pbPixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {Pointer<WICRect>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource
     */
    WriteSource(pIBitmapSource, prc) {
        result := ComCall(11, this, "ptr", pIBitmapSource, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-commit
     */
    Commit() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIMetadataQueryWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-getmetadataquerywriter
     */
    GetMetadataQueryWriter(ppIMetadataQueryWriter) {
        result := ComCall(13, this, "ptr*", ppIMetadataQueryWriter, "HRESULT")
        return result
    }
}
