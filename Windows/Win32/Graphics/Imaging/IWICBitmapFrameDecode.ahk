#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataQueryReader.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Defines methods for decoding individual image frames of an encoded file.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapframedecode
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
     * @returns {IWICMetadataQueryReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>**</b>
     * 
     * When this method returns, contains a pointer to the frame's metadata query reader.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframedecode-getmetadataqueryreader
     */
    GetMetadataQueryReader() {
        result := ComCall(8, this, "ptr*", &ppIMetadataQueryReader := 0, "HRESULT")
        return IWICMetadataQueryReader(ppIMetadataQueryReader)
    }

    /**
     * Retrieves the IWICColorContext associated with the image frame.
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
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframedecode-getcolorcontexts
     */
    GetColorContexts(cCount, ppIColorContexts) {
        result := ComCall(9, this, "uint", cCount, "ptr*", ppIColorContexts, "uint*", &pcActualCount := 0, "HRESULT")
        return pcActualCount
    }

    /**
     * Retrieves a small preview of the frame, if supported by the codec.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> of the thumbnail.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapframedecode-getthumbnail
     */
    GetThumbnail() {
        result := ComCall(10, this, "ptr*", &ppIThumbnail := 0, "HRESULT")
        return IWICBitmapSource(ppIThumbnail)
    }
}
