#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide access to all of the codec's top level metadata blocks.
 * @remarks
 * 
  * <b>IWICMetadataBlockReader</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter">IWICMetadataBlockWriter</a> operate at the root level only; that is, they provide read and write access, respectively, to the top level metadata blocks. They are implemented by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>, respectively. To handle any metadata blocks that are not at the top level of the hierarchy, use <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>.
  * 
  * 
  * <div class="alert"><b>Note</b>  The codec's decoder and encoder implement this interface to expose the enumeration of all top level metadata blocks.  While the codec parses the image stream, it calls services like <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareaderfromcontainer">CreateMetadataReaderFromContainer</a> to instantiate metadata readers for any block that is recognized as being able to be embedded in the decoder's container format.  The collection of metadata readers is exposed through this interface. For more info, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled CODEC</a>.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataBlockReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataBlockReader
     * @type {Guid}
     */
    static IID => Guid("{feaa2a8d-b3f3-43e4-b25c-d1de990a1ae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainerFormat", "GetCount", "GetReaderByIndex", "GetEnumerator"]

    /**
     * 
     * @param {Pointer<Guid>} pguidContainerFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getcontainerformat
     */
    GetContainerFormat(pguidContainerFormat) {
        result := ComCall(3, this, "ptr", pguidContainerFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getcount
     */
    GetCount(pcCount) {
        result := ComCall(4, this, "uint*", pcCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IWICMetadataReader>} ppIMetadataReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getreaderbyindex
     */
    GetReaderByIndex(nIndex, ppIMetadataReader) {
        result := ComCall(5, this, "uint", nIndex, "ptr*", ppIMetadataReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumUnknown>} ppIEnumMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getenumerator
     */
    GetEnumerator(ppIEnumMetadata) {
        result := ComCall(6, this, "ptr*", ppIEnumMetadata, "HRESULT")
        return result
    }
}
