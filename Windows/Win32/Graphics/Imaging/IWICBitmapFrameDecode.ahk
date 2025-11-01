#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IWICMetadataQueryReader>} ppIMetadataQueryReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getmetadataqueryreader
     */
    GetMetadataQueryReader(ppIMetadataQueryReader) {
        result := ComCall(8, this, "ptr*", ppIMetadataQueryReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCount 
     * @param {Pointer<IWICColorContext>} ppIColorContexts 
     * @param {Pointer<Integer>} pcActualCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getcolorcontexts
     */
    GetColorContexts(cCount, ppIColorContexts, pcActualCount) {
        pcActualCountMarshal := pcActualCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cCount, "ptr*", ppIColorContexts, pcActualCountMarshal, pcActualCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapSource>} ppIThumbnail 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapframedecode-getthumbnail
     */
    GetThumbnail(ppIThumbnail) {
        result := ComCall(10, this, "ptr*", ppIThumbnail, "HRESULT")
        return result
    }
}
