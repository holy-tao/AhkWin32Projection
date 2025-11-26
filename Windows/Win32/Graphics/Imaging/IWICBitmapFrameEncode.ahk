#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataQueryWriter.ahk
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
     * Initializes the frame encoder using the given properties.
     * @param {IPropertyBag2} pIEncoderOptions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>*</b>
     * 
     * The set of properties to use for <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a> initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-initialize
     */
    Initialize(pIEncoderOptions) {
        result := ComCall(3, this, "ptr", pIEncoderOptions, "HRESULT")
        return result
    }

    /**
     * Sets the output image dimensions for the frame.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width of the output image.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height of the output image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setsize
     */
    SetSize(uiWidth, uiHeight) {
        result := ComCall(4, this, "uint", uiWidth, "uint", uiHeight, "HRESULT")
        return result
    }

    /**
     * Sets the physical resolution of the output image.
     * @param {Float} dpiX Type: <b>double</b>
     * 
     * The horizontal resolution value.
     * @param {Float} dpiY Type: <b>double</b>
     * 
     * The vertical resolution value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setresolution
     */
    SetResolution(dpiX, dpiY) {
        result := ComCall(5, this, "double", dpiX, "double", dpiY, "HRESULT")
        return result
    }

    /**
     * Requests that the encoder use the specified pixel format.
     * @param {Pointer<Guid>} pPixelFormat Type: <b>WICPixelFormatGUID*</b>
     * 
     * On input, the requested pixel format GUID. On output, the closest pixel format GUID supported by the encoder; this may be different than the requested format. For a list of pixel format GUIDs, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">Native Pixel Formats</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINCODEC_ERR_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-initialize">IWICBitmapFrameEncode::Initialize</a> method was not called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat
     */
    SetPixelFormat(pPixelFormat) {
        result := ComCall(6, this, "ptr", pPixelFormat, "HRESULT")
        return result
    }

    /**
     * Sets a given number IWICColorContext profiles to the frame.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> profiles to set.
     * @param {Pointer<IWICColorContext>} ppIColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> pointer containing the color contexts profiles to set to the frame.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setcolorcontexts
     */
    SetColorContexts(cCount, ppIColorContext) {
        result := ComCall(7, this, "uint", cCount, "ptr*", ppIColorContext, "HRESULT")
        return result
    }

    /**
     * Sets the IWICPalette for indexed pixel formats.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to use for indexed pixel formats.
     * 
     * The encoder may change the palette to reflect the pixel formats the encoder supports.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(8, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Sets the frame thumbnail if supported by the codec.
     * @param {IWICBitmapSource} pIThumbnail Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source to use as the thumbnail.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-setthumbnail
     */
    SetThumbnail(pIThumbnail) {
        result := ComCall(9, this, "ptr", pIThumbnail, "HRESULT")
        return result
    }

    /**
     * Copies scan-line data from a caller-supplied buffer to the IWICBitmapFrameEncode object.
     * @param {Integer} lineCount Type: <b>UINT</b>
     * 
     * The number of lines to encode.
     * @param {Integer} cbStride Type: <b>UINT</b>
     * 
     * The <a href="https://docs.microsoft.com/">stride</a> of the image pixels.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of the pixel buffer.
     * @param {Pointer<Integer>} pbPixels Type: <b>BYTE*</b>
     * 
     * A pointer to the pixel buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINCODEC_ERR_CODECTOOMANYSCANLINES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>lineCount</i> is larger than the number of scan lines in the image.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-writepixels
     */
    WritePixels(lineCount, cbStride, cbBufferSize, pbPixels) {
        pbPixelsMarshal := pbPixels is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", lineCount, "uint", cbStride, "uint", cbBufferSize, pbPixelsMarshal, pbPixels, "HRESULT")
        return result
    }

    /**
     * Encodes a bitmap source.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source to encode.
     * @param {Pointer<WICRect>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The size rectangle of the bitmap source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-writesource
     */
    WriteSource(pIBitmapSource, prc) {
        result := ComCall(11, this, "ptr", pIBitmapSource, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Commits the frame to the image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-commit
     */
    Commit() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Gets the metadata query writer for the encoder frame.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to metadata query writer for the encoder frame.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframeencode-getmetadataquerywriter
     */
    GetMetadataQueryWriter() {
        result := ComCall(13, this, "ptr*", &ppIMetadataQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIMetadataQueryWriter)
    }
}
