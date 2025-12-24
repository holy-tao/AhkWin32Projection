#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapDecoderInfo.ahk
#Include .\IWICMetadataQueryReader.ahk
#Include .\IWICBitmapSource.ahk
#Include .\IWICBitmapFrameDecode.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that represent a decoder.
 * @remarks
 * 
 * There are a number of concrete implemenations of this interface representing each of the standard decoders provided by the platform including bitmap (BMP), Portable Network Graphics (PNG), icon (ICO), Joint Photographic Experts Group (JPEG), Graphics Interchange Format (GIF), Tagged Image File Format (TIFF), and Microsoft Windows Digital Photo (WDP). The following table includes the class identifier (CLSID) for each native decoder.
 *             
 * 
 * <table class="clsStd">
 * <tr>
 * <th>CLSID Name</th>
 * <th>CLSID</th>
 * </tr>
 * <tr>
 * <td>CLSID_WICBmpDecoder</td>
 * <td>0x6b462062, 0x7cbf, 0x400d, 0x9f, 0xdb, 0x81, 0x3d, 0xd1, 0xf, 0x27, 0x78</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICGifDecoder</td>
 * <td>0x381dda3c, 0x9ce9, 0x4834, 0xa2, 0x3e, 0x1f, 0x98, 0xf8, 0xfc, 0x52, 0xbe</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICHeifDecoder</td>
 * <td>0xe9a4a80a, 0x44fe, 0x4de4, 0x89, 0x71, 0x71, 0x50, 0xb1, 0x0a, 0x51, 0x99</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICIcoDecoder</td>
 * <td>0xc61bfcdf, 0x2e0f, 0x4aad, 0xa8, 0xd7, 0xe0, 0x6b, 0xaf, 0xeb, 0xcd, 0xfe</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICJpegDecoder</td>
 * <td>0x9456a480, 0xe88b, 0x43ea, 0x9e, 0x73, 0xb, 0x2d, 0x9b, 0x71, 0xb1, 0xca</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICPngDecoder</td>
 * <td>0x389ea17b, 0x5078, 0x4cde, 0xb6, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICTiffDecoder</td>
 * <td>0xb54e85d9, 0xfe23, 0x499f, 0x8b, 0x88, 0x6a, 0xce, 0xa7, 0x13, 0x75, 0x2b</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWebpDecoder</td>
 * <td>0x7693e886, 0x51c9, 0x4070, 0x84, 0x19, 0x9f, 0x70, 0X73, 0X8e, 0Xc8, 0Xfa</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWmpDecoder</td>
 * <td>0xa26cec36, 0x234c, 0x4950, 0xae, 0x16, 0xe3, 0x4a, 0xac, 0xe7, 0x1d, 0x0d</td>
 * </tr>
 * </table>
 *  
 * 
 * This interface may be sub-classed to provide support for third party codecs as part of the extensibility model. See the <a href="https://docs.microsoft.com/previous-versions/ms771770(v=vs.100)">AITCodec Sample CODEC</a>.
 * 
 * Codecs written as TIFF container formats that are not register will decode as a TIFF image. Client applications should check for a zero frame count to determine if the codec is valid.
 * 
 * CLSID_WICHeifDecoder operates on HEIF (High Efficiency Image Format) images.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapdecoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapDecoder
     * @type {Guid}
     */
    static IID => Guid("{9edde9e7-8dee-47ea-99df-e6faf2ed44bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryCapability", "Initialize", "GetContainerFormat", "GetDecoderInfo", "CopyPalette", "GetMetadataQueryReader", "GetPreview", "GetColorContexts", "GetThumbnail", "GetFrameCount", "GetFrame"]

    /**
     * Retrieves the capabilities of the decoder based on the specified stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to retrieve the decoder capabilities from.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdecodercapabilities">WICBitmapDecoderCapabilities</a> of the decoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-querycapability
     */
    QueryCapability(pIStream) {
        result := ComCall(3, this, "ptr", pIStream, "uint*", &pdwCapability := 0, "HRESULT")
        return pdwCapability
    }

    /**
     * Initializes the decoder with the provided stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to use for initialization.
     * 
     * The stream contains the encoded pixels which are decoded each time the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> interface (see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapdecoder-getframe">GetFrame</a>) is invoked.
     * @param {Integer} cacheOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use for initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-initialize
     */
    Initialize(pIStream, cacheOptions) {
        result := ComCall(4, this, "ptr", pIStream, "int", cacheOptions, "HRESULT")
        return result
    }

    /**
     * Retrieves the image's container format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer that receives the image's container format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(5, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves an IWICBitmapDecoderInfo for the image.
     * @returns {IWICBitmapDecoderInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoderinfo">IWICBitmapDecoderInfo</a>**</b>
     * 
     * A pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoderinfo">IWICBitmapDecoderInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getdecoderinfo
     */
    GetDecoderInfo() {
        result := ComCall(6, this, "ptr*", &ppIDecoderInfo := 0, "HRESULT")
        return IWICBitmapDecoderInfo(ppIDecoderInfo)
    }

    /**
     * Copies the decoder's IWICPalette .
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * An<a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to which the decoder's global palette is to be copied. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createpalette">CreatePalette</a> to create the destination palette before calling <b>CopyPalette</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-copypalette
     */
    CopyPalette(pIPalette) {
        result := ComCall(7, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Retrieves the metadata query reader from the decoder.
     * @returns {IWICMetadataQueryReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>**</b>
     * 
     * Receives a pointer to the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getmetadataqueryreader
     */
    GetMetadataQueryReader() {
        result := ComCall(8, this, "ptr*", &ppIMetadataQueryReader := 0, "HRESULT")
        return IWICMetadataQueryReader(ppIMetadataQueryReader)
    }

    /**
     * Retrieves a preview image, if supported.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * Receives a pointer to the preview bitmap if supported.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getpreview
     */
    GetPreview() {
        result := ComCall(9, this, "ptr*", &ppIBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppIBitmapSource)
    }

    /**
     * Retrieves the IWICColorContext objects of the image.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of color contexts to retrieve.
     * 
     * This value must be the size of, or smaller than, the size available to <i>ppIColorContexts</i>.
     * @param {Pointer<IWICColorContext>} ppIColorContexts Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the number of color contexts contained in the image.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getcolorcontexts
     */
    GetColorContexts(cCount, ppIColorContexts) {
        result := ComCall(10, this, "uint", cCount, "ptr*", ppIColorContexts, "uint*", &pcActualCount := 0, "HRESULT")
        return pcActualCount
    }

    /**
     * Retrieves a bitmap thumbnail of the image, if one exists
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> of the thumbnail.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getthumbnail
     */
    GetThumbnail() {
        result := ComCall(11, this, "ptr*", &ppIThumbnail := 0, "HRESULT")
        return IWICBitmapSource(ppIThumbnail)
    }

    /**
     * Retrieves the total number of frames in the image.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the total number of frames in the image.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getframecount
     */
    GetFrameCount() {
        result := ComCall(12, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the specified frame of the image.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * The particular frame to retrieve.
     * @returns {IWICBitmapFrameDecode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapdecoder-getframe
     */
    GetFrame(index) {
        result := ComCall(13, this, "uint", index, "ptr*", &ppIBitmapFrame := 0, "HRESULT")
        return IWICBitmapFrameDecode(ppIBitmapFrame)
    }
}
