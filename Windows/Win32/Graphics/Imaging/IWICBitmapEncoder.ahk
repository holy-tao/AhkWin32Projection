#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapEncoderInfo.ahk
#Include .\IWICBitmapFrameEncode.ahk
#Include .\IWICMetadataQueryWriter.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for setting an encoder's properties such as thumbnails, frames, and palettes.
 * @remarks
 * 
 * There are a number of concrete implemenations of this interface representing each of the standard encoders provided by the platform including bitmap (BMP), Portable Network Graphics (PNG), Joint Photographic Experts Group (JPEG), Graphics Interchange Format (GIF), Tagged Image File Format (TIFF), and Microsoft Windows Digital Photo (WDP). The following table includes the class identifier (CLSID) for each native encoder.
 *             
 * 
 * <table class="clsStd">
 * <tr>
 * <th>CLSID Name</th>
 * <th>CLSID</th>
 * </tr>
 * <tr>
 * <td>CLSID_WICBmpEncoder</td>
 * <td>0x69be8bb4, 0xd66d, 0x47c8, 0x86, 0x5a, 0xed, 0x15, 0x89, 0x43, 0x37, 0x82</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICGifEncoder</td>
 * <td>0x114f5598, 0xb22, 0x40a0, 0x86, 0xa1, 0xc8, 0x3e, 0xa4, 0x95, 0xad, 0xbd</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICHeifEncoder</td>
 * <td>0x0dbecec1, 0x9eb3, 0x4860, 0x9c, 0x6f, 0xdd, 0xbe, 0x86, 0x63, 0x45, 0x75</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICJpegEncoder</td>
 * <td>0x1a34f5c1, 0x4a5a, 0x46dc, 0xb6, 0x44, 0x1f, 0x45, 0x67, 0xe7, 0xa6, 0x76</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICPngEncoder</td>
 * <td>0x27949969, 0x876a, 0x41d7, 0x94, 0x47, 0x56, 0x8f, 0x6a, 0x35, 0xa4, 0xdc</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICTiffEncoder</td>
 * <td>0x0131be10, 0x2001, 0x4c5f, 0xa9, 0xb0, 0xcc, 0x88, 0xfa, 0xb6, 0x4c, 0xe8</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWmpEncoder</td>
 * <td>0xac4ce3cb, 0xe1c1, 0x44cd, 0x82, 0x15, 0x5a, 0x16, 0x65, 0x50, 0x9e, 0xc2</td>
 * </tr>
 * </table>
 *  
 * 
 * Additionally this interface may be sub-classed to provide support for third party codecs as part of the extensibility model. See the <a href="https://docs.microsoft.com/previous-versions/ms771770(v=vs.100)">AITCodec Sample CODEC</a>.
 * 
 * CLSID_WICHeifDecoder operates on HEIF (High Efficiency Image Format) images.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapencoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapEncoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapEncoder
     * @type {Guid}
     */
    static IID => Guid("{00000103-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetContainerFormat", "GetEncoderInfo", "SetColorContexts", "SetPalette", "SetThumbnail", "SetPreview", "CreateNewFrame", "Commit", "GetMetadataQueryWriter"]

    /**
     * Initializes the encoder with an IStream which tells the encoder where to encode the bits.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The output stream.
     * @param {Integer} cacheOption Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapencodercacheoption">WICBitmapEncoderCacheOption</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapencodercacheoption">WICBitmapEncoderCacheOption</a> used on initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-initialize
     */
    Initialize(pIStream, cacheOption) {
        result := ComCall(3, this, "ptr", pIStream, "int", cacheOption, "HRESULT")
        return result
    }

    /**
     * Retrieves the encoder's container format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer that receives the encoder's container format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(4, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves an IWICBitmapEncoderInfo for the encoder.
     * @returns {IWICBitmapEncoderInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoderinfo">IWICBitmapEncoderInfo</a>**</b>
     * 
     * A pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoderinfo">IWICBitmapEncoderInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-getencoderinfo
     */
    GetEncoderInfo() {
        result := ComCall(5, this, "ptr*", &ppIEncoderInfo := 0, "HRESULT")
        return IWICBitmapEncoderInfo(ppIEncoderInfo)
    }

    /**
     * Sets the IWICColorContext objects for the encoder.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> to set.
     * @param {Pointer<IWICColorContext>} ppIColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> pointer containing the color contexts to set for the encoder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-setcolorcontexts
     */
    SetColorContexts(cCount, ppIColorContext) {
        result := ComCall(6, this, "uint", cCount, "ptr*", ppIColorContext, "HRESULT")
        return result
    }

    /**
     * Sets the global palette for the image.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to use as the global palette.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(7, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Sets the global thumbnail for the image.
     * @param {IWICBitmapSource} pIThumbnail Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to set as the global thumbnail.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-setthumbnail
     */
    SetThumbnail(pIThumbnail) {
        result := ComCall(8, this, "ptr", pIThumbnail, "HRESULT")
        return result
    }

    /**
     * Sets the global preview for the image.
     * @param {IWICBitmapSource} pIPreview Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to use as the global preview.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-setpreview
     */
    SetPreview(pIPreview) {
        result := ComCall(9, this, "ptr", pIPreview, "HRESULT")
        return result
    }

    /**
     * Creates a new IWICBitmapFrameEncode instance.
     * @param {Pointer<IPropertyBag2>} ppIEncoderOptions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>**</b>
     * 
     * Optional. Receives the named properties to use for subsequent frame initialization. See Remarks.
     * @returns {IWICBitmapFrameEncode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>**</b>
     * 
     * A pointer that receives a pointer to the new instance of an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-createnewframe
     */
    CreateNewFrame(ppIEncoderOptions) {
        result := ComCall(10, this, "ptr*", &ppIFrameEncode := 0, "ptr*", ppIEncoderOptions, "HRESULT")
        return IWICBitmapFrameEncode(ppIFrameEncode)
    }

    /**
     * Commits all changes for the image and closes the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-commit
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a metadata query writer for the encoder.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to the encoder's metadata query writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoder-getmetadataquerywriter
     */
    GetMetadataQueryWriter() {
        result := ComCall(12, this, "ptr*", &ppIMetadataQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIMetadataQueryWriter)
    }
}
