#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataQueryWriter.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an encoder's individual image frames.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapframeencode
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
     * @remarks
     * If you don't want any encoding options, pass <b>NULL</b> for <i>pIEncoderOptions</i>. Otherwise, pass the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a> that was provided by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-createnewframe">IWICBitmapEncoder::CreateNewFrame</a> with updated values.
     * 
     * 
     * For a complete list of encoding options supported by the Windows-provided codecs, see <a href="https://docs.microsoft.com/windows/desktop/wic/native-wic-codecs">Native WIC Codecs</a>.
     * @param {IPropertyBag2} pIEncoderOptions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>*</b>
     * 
     * The set of properties to use for <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a> initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-initialize
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize
     */
    SetSize(uiWidth, uiHeight) {
        result := ComCall(4, this, "uint", uiWidth, "uint", uiHeight, "HRESULT")
        return result
    }

    /**
     * Sets the physical resolution of the output image.
     * @remarks
     * Windows Imaging Component (WIC) doesn't perform any special processing as a result of DPI resolution values. For example, data returned from <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">IWICBitmapSource::CopyPixels</a> isn't scaled by the DPI. The app must handle DPI resolution.
     * @param {Float} dpiX Type: <b>double</b>
     * 
     * The horizontal resolution value.
     * @param {Float} dpiY Type: <b>double</b>
     * 
     * The vertical resolution value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setresolution
     */
    SetResolution(dpiX, dpiY) {
        result := ComCall(5, this, "double", dpiX, "double", dpiY, "HRESULT")
        return result
    }

    /**
     * Requests that the encoder use the specified pixel format.
     * @remarks
     * The encoder might not support the requested pixel format. If not, <b>SetPixelFormat</b> returns the closest match in the memory block that <i>pPixelFormat</i> points to. If the returned pixel format doesn't match the requested format, you must use an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a> object to convert the pixel data.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-initialize">IWICBitmapFrameEncode::Initialize</a> method was not called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat
     */
    SetPixelFormat(pPixelFormat) {
        result := ComCall(6, this, "ptr", pPixelFormat, "HRESULT")
        return result
    }

    /**
     * Sets a given number IWICColorContext profiles to the frame.
     * @remarks
     * <ul>
     * <li><b>BMP</b>Setting color contexts is unsupported. This function will return <b>WINCODEC_ERR_UNSUPPORTEDOPERATION</b>.
     * 
     * </li>
     * <li><b>PNG</b>Setting at most one color context is supported, and additional color contexts will be ignored. This context must be a <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextProfile</a>, and is used to encode the iCCP, gAMA, and cHRM chunks in the PNG file.
     * 
     * </li>
     * <li><b>JPEG, TIFF, JPEG-XR</b>Setting up to one <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextProfile</a> and one  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextExifColorSpace</a> is supported. Users must not provide more than one of each type of color context, as all but the last context of each type will be ignored. In JPEG, the <b>WICColorContextProfile</b> is encoded to JPEG APP2 ICC metadata block.
     * 
     * In TIFF and JPEG-XR, the  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextProfile</a> is encoded to the IFD ICC profile metadata block (IFD tag 0x8773). In all three formats, the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccolorcontexttype">WICColorContextExifColorSpace</a> is encoded to EXIF colorspace metadata block (EXIF tag 0xA001).
     * 
     * 
     * </li>
     * </ul>
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> profiles to set.
     * @param {Pointer<IWICColorContext>} ppIColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> pointer containing the color contexts profiles to set to the frame.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setcolorcontexts
     */
    SetColorContexts(cCount, ppIColorContext) {
        result := ComCall(7, this, "uint", cCount, "ptr*", ppIColorContext, "HRESULT")
        return result
    }

    /**
     * Sets the IWICPalette for indexed pixel formats.
     * @remarks
     * This method doesn't fail if called on a frame whose pixel format is set to a non-indexed pixel format. If the target pixel format is a non-indexed format, the palette will be ignored.
     * 
     * If you already called <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-setpalette">IWICBitmapEncoder::SetPalette</a> to set a global palette, this method overrides that palette for the current frame.
     * 
     * The palette must be specified before your first call to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicplanarbitmapframeencode-writepixels">WritePixels</a>/<a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource">WriteSource</a>. Doing so will cause <b>WriteSource</b> to use the specified palette when converting the source image to the encoder pixel format. If no palette is specified, a palette will be generated on the first call to <b>WriteSource</b>.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to use for indexed pixel formats.
     * 
     * The encoder may change the palette to reflect the pixel formats the encoder supports.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(8, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Sets the frame thumbnail if supported by the codec.
     * @remarks
     * We recommend that you call
     * 			   <b>SetThumbnail</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels">WritePixels</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource">WriteSource</a>.
     * 				The thumbnail won't be added to the encoded file if <b>SetThumbnail</b> is called after a call to <b>WritePixels</b> or <b>WriteSource</b>.
     * 			
     * 
     * <ul>
     * <li><b>BMP, PNG</b>Setting thumbnails is unsupported. This function will return <b>WINCODEC_ERR_UNSUPPORTEDOPERATION</b>.
     * 
     * </li>
     * <li><b>JPEG</b>Setting the thumbnail is supported. The source image will be re-encoded as either an 8bpp or 24bpp JPEG and will be written to the JPEG’s APP1 metadata block.
     * 
     * 
     * </li>
     * <li><b>TIFF</b> Setting the thumbnail is supported. The source image will be re-encoded as a TIFF and will be written to the frame’s SubIFD block.
     * 
     * </li>
     * <li><b>JPEG-XR</b>Setting the thumbnail is supported. The source image will be re-encoded as an additional 8bpp or 24bpp frame.
     * 
     * 
     * </li>
     * </ul>
     * @param {IWICBitmapSource} pIThumbnail Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source to use as the thumbnail.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-setthumbnail
     */
    SetThumbnail(pIThumbnail) {
        result := ComCall(9, this, "ptr", pIThumbnail, "HRESULT")
        return result
    }

    /**
     * Copies scan-line data from a caller-supplied buffer to the IWICBitmapFrameEncode object.
     * @remarks
     * Successive <b>WritePixels</b> calls are assumed to be sequential scan-line access in the output image.
     * @param {Integer} lineCount Type: <b>UINT</b>
     * 
     * The number of lines to encode.
     * @param {Integer} cbStride Type: <b>UINT</b>
     * 
     * The stride of the image pixels.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels
     */
    WritePixels(lineCount, cbStride, cbBufferSize, pbPixels) {
        pbPixelsMarshal := pbPixels is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", lineCount, "uint", cbStride, "uint", cbBufferSize, pbPixelsMarshal, pbPixels, "HRESULT")
        return result
    }

    /**
     * Encodes a bitmap source.
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">SetSize</a> is not called prior to calling <b>WriteSource</b>, the size given in <i>prc</i> is used if not <b>NULL</b>. Otherwise, the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> given in <i>pIBitmapSource</i> is used. 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">SetPixelFormat</a> is not called prior to calling <b>WriteSource</b>, the pixel format of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> given in <i>pIBitmapSource</i> is used.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setresolution">SetResolution</a> is not called prior to calling <b>WriteSource</b>, the pixel format of <i>pIBitmapSource</i> is used.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpalette">SetPalette</a> is not called prior to calling <b>WriteSource</b>, the target pixel format is indexed, and the pixel format of <i>pIBitmapSource</i> matches the encoder frame's pixel format, then the <i>pIBitmapSource</i> pixel format is used.
     * 
     * When encoding a GIF image, if the global palette is set and the frame level palette is not set directly by the user or by a custom independent software vendor (ISV) GIF codec, <b>WriteSource</b> will use the global palette to encode the frame even when <i>pIBitmapSource</i> has a frame level palette.
     * 
     * Starting with  Windows Vista, repeated <b>WriteSource</b> calls can be made as long as the total accumulated source rect height is the same as set through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">SetSize</a>.
     * 
     * Starting with Windows 8.1, the source rect must be at least the dimensions set through <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">SetSize</a>. If the source rect width exceeds the <b>SetSize</b> width, extra pixels on the right side are ignored. If the source rect height exceeds the remaining unfilled height, extra scan lines on the bottom are ignored.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The bitmap source to encode.
     * @param {Pointer<WICRect>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrect">WICRect</a>*</b>
     * 
     * The size rectangle of the bitmap source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource
     */
    WriteSource(pIBitmapSource, prc) {
        result := ComCall(11, this, "ptr", pIBitmapSource, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Commits the frame to the image.
     * @remarks
     * After the frame <b>Commit</b> has been called, you can't use or reinitialize the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a> object and any objects created from it.
     * 
     * 
     * To finalize the image, both the frame <b>Commit</b> and the encoder <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-commit">Commit</a> must be called. However, only call the encoder  <b>Commit</b> method after all frames have been committed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-commit
     */
    Commit() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Gets the metadata query writer for the encoder frame.
     * @remarks
     * If you are setting metadata on the frame, you must do this before you use <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels">IWICBitmapFrameEncode::WritePixels</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource">IWICBitmapFrameEncode::WriteSource</a> to write any image pixels to the frame
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to metadata query writer for the encoder frame.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframeencode-getmetadataquerywriter
     */
    GetMetadataQueryWriter() {
        result := ComCall(13, this, "ptr*", &ppIMetadataQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIMetadataQueryWriter)
    }
}
