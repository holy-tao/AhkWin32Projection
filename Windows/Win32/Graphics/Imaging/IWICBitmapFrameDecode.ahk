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
     * 
     * @param {Pointer<IWICMetadataQueryReader>} ppIMetadataQueryReader 
     * @returns {HRESULT} 
     */
    GetMetadataQueryReader(ppIMetadataQueryReader) {
        result := ComCall(8, this, "ptr", ppIMetadataQueryReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCount 
     * @param {Pointer<IWICColorContext>} ppIColorContexts 
     * @param {Pointer<UInt32>} pcActualCount 
     * @returns {HRESULT} 
     */
    GetColorContexts(cCount, ppIColorContexts, pcActualCount) {
        result := ComCall(9, this, "uint", cCount, "ptr", ppIColorContexts, "uint*", pcActualCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapSource>} ppIThumbnail 
     * @returns {HRESULT} 
     */
    GetThumbnail(ppIThumbnail) {
        result := ComCall(10, this, "ptr", ppIThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
