#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataBlockReader.ahk

/**
 * Exposes methods that enable the encoding of metadata. This interface is implemented by the decoder and its image frames.
 * @remarks
 * 
  * When the encoder is told to commit, it goes through each metadata writer and serializes the metadata content into the encoding stream.
  *             If the metadata block contains metadata important to the integrity of the file, such as the image width or height or other intrinsic information about the image, the encoder must set the critical metadata items prior to serializing the metadata.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataBlockWriter extends IWICMetadataBlockReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICMetadataBlockWriter
     * @type {Guid}
     */
    static IID => Guid("{08fb9676-b444-41e8-8dbe-6a53a542bff1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromBlockReader", "GetWriterByIndex", "AddWriter", "SetWriterByIndex", "RemoveWriterByIndex"]

    /**
     * 
     * @param {IWICMetadataBlockReader} pIMDBlockReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-initializefromblockreader
     */
    InitializeFromBlockReader(pIMDBlockReader) {
        result := ComCall(7, this, "ptr", pIMDBlockReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IWICMetadataWriter>} ppIMetadataWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-getwriterbyindex
     */
    GetWriterByIndex(nIndex, ppIMetadataWriter) {
        result := ComCall(8, this, "uint", nIndex, "ptr*", ppIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICMetadataWriter} pIMetadataWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-addwriter
     */
    AddWriter(pIMetadataWriter) {
        result := ComCall(9, this, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {IWICMetadataWriter} pIMetadataWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-setwriterbyindex
     */
    SetWriterByIndex(nIndex, pIMetadataWriter) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-removewriterbyindex
     */
    RemoveWriterByIndex(nIndex) {
        result := ComCall(11, this, "uint", nIndex, "HRESULT")
        return result
    }
}
