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
     * 
     * @param {Pointer<IWICMetadataBlockReader>} pIMDBlockReader 
     * @returns {HRESULT} 
     */
    InitializeFromBlockReader(pIMDBlockReader) {
        result := ComCall(7, this, "ptr", pIMDBlockReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IWICMetadataWriter>} ppIMetadataWriter 
     * @returns {HRESULT} 
     */
    GetWriterByIndex(nIndex, ppIMetadataWriter) {
        result := ComCall(8, this, "uint", nIndex, "ptr", ppIMetadataWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataWriter>} pIMetadataWriter 
     * @returns {HRESULT} 
     */
    AddWriter(pIMetadataWriter) {
        result := ComCall(9, this, "ptr", pIMetadataWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IWICMetadataWriter>} pIMetadataWriter 
     * @returns {HRESULT} 
     */
    SetWriterByIndex(nIndex, pIMetadataWriter) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pIMetadataWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    RemoveWriterByIndex(nIndex) {
        result := ComCall(11, this, "uint", nIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
