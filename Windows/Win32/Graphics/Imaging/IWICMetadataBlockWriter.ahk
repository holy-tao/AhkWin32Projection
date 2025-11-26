#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataWriter.ahk
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
     * Initializes an IWICMetadataBlockWriter from the given IWICMetadataBlockReader. This will prepopulate the metadata block writer with all the metadata in the metadata block reader.
     * @param {IWICMetadataBlockReader} pIMDBlockReader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a> used to initialize the block writer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-initializefromblockreader
     */
    InitializeFromBlockReader(pIMDBlockReader) {
        result := ComCall(7, this, "ptr", pIMDBlockReader, "HRESULT")
        return result
    }

    /**
     * Retrieves the IWICMetadataWriter that resides at the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata writer to be retrieved. This index is zero-based.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to the metadata writer that resides at the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-getwriterbyindex
     */
    GetWriterByIndex(nIndex) {
        result := ComCall(8, this, "uint", nIndex, "ptr*", &ppIMetadataWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIMetadataWriter)
    }

    /**
     * Adds a top-level metadata block by adding a IWICMetadataWriter for it.
     * @param {IWICMetadataWriter} pIMetadataWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * A pointer to the metadata writer to add to the image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-addwriter
     */
    AddWriter(pIMetadataWriter) {
        result := ComCall(9, this, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * Replaces the metadata writer at the specified index location.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index position at which to place the metadata writer. This index is zero-based.
     * @param {IWICMetadataWriter} pIMetadataWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-setwriterbyindex
     */
    SetWriterByIndex(nIndex, pIMetadataWriter) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * Removes the metadata writer from the specified index location.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata writer to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-removewriterbyindex
     */
    RemoveWriterByIndex(nIndex) {
        result := ComCall(11, this, "uint", nIndex, "HRESULT")
        return result
    }
}
