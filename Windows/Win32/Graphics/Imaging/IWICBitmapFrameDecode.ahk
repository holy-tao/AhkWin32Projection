#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataQueryReader.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Defines methods for decoding individual image frames of an encoded file.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapframedecode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapFrameDecode extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapFrameDecode
     * @type {Guid}
     */
    static IID => Guid("{3b16811b-6a43-4ec9-a813-3d930c13b940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadataQueryReader", "GetColorContexts", "GetThumbnail"]

    /**
     * Retrieves a metadata query reader for the frame.
     * @remarks
     * For image formats with one frame (JPG, PNG, JPEG-XR), the frame-level query reader of the first frame is used to access all image metadata, and the decoder-level query reader isn’t used. For formats with more than one frame (GIF, TIFF), the frame-level query reader for a given frame is used to access metadata specific to that frame, and in the case of GIF a decoder-level metadata reader will be present. If the decoder doesn’t support metadata (BMP, ICO), this will return <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-error-codes">WINCODEC_ERR_UNSUPPORTEDOPERATION</a>.
     * @returns {IWICMetadataQueryReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>**</b>
     * 
     * When this method returns, contains a pointer to the frame's metadata query reader.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getmetadataqueryreader
     */
    GetMetadataQueryReader() {
        result := ComCall(8, this, "ptr*", &ppIMetadataQueryReader := 0, "HRESULT")
        return IWICMetadataQueryReader(ppIMetadataQueryReader)
    }

    /**
     * Retrieves the IWICColorContext associated with the image frame.
     * @remarks
     * If NULL is passed for <i>ppIColorContexts</i>, and 0 is passed for <i>cCount</i>, this method will return the total number of color contexts in the image in <i>pcActualCount</i>.
     * 
     * 
     * 
     * The <i>ppIColorContexts</i> array must be filled with valid data: each <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext*</a> in the array must have been created using <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createcolorcontext">IWICImagingFactory::CreateColorContext</a>.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of color contexts to retrieve.
     * 
     * This value must be the size of, or smaller than, the size available to <i>ppIColorContexts</i>.
     * @param {Pointer<IWICColorContext>} ppIColorContexts Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> objects.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the number of color contexts contained in the image frame.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getcolorcontexts
     */
    GetColorContexts(cCount, ppIColorContexts) {
        result := ComCall(9, this, "uint", cCount, "ptr*", ppIColorContexts, "uint*", &pcActualCount := 0, "HRESULT")
        return pcActualCount
    }

    /**
     * Retrieves a small preview of the frame, if supported by the codec.
     * @remarks
     * Not all formats support thumbnails. Joint Photographic Experts Group (JPEG), Tagged Image File Format (TIFF), and Microsoft Windows Digital Photo (WDP) support thumbnails.
     * 
     * <h3><a id="Note_to_Implementers"></a><a id="note_to_implementers"></a><a id="NOTE_TO_IMPLEMENTERS"></a>Note to Implementers</h3>
     * If the codec does not support thumbnails, return WINCODEC_ERROR_CODECNOTHUMBNAIL rather than E_NOTIMPL.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> of the thumbnail.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getthumbnail
     */
    GetThumbnail() {
        result := ComCall(10, this, "ptr*", &ppIThumbnail := 0, "HRESULT")
        return IWICBitmapSource(ppIThumbnail)
    }
}
