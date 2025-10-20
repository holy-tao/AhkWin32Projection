#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICImagingFactory.ahk

/**
 * Exposes methods that create components used by component developers. This includes metadata readers, writers and other services for use by codec and metadata handler developers.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwiccomponentfactory
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICComponentFactory extends IWICImagingFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICComponentFactory
     * @type {Guid}
     */
    static IID => Guid("{412d0c3a-9650-44fa-af5b-dd2a06c8e8fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMetadataReader", "CreateMetadataReaderFromContainer", "CreateMetadataWriter", "CreateMetadataWriterFromReader", "CreateQueryReaderFromBlockReader", "CreateQueryWriterFromBlockWriter", "CreateEncoderPropertyBag"]

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwOptions 
     * @param {IStream} pIStream 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareader
     */
    CreateMetadataReader(guidMetadataFormat, pguidVendor, dwOptions, pIStream, ppIReader) {
        result := ComCall(28, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", ppIReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwOptions 
     * @param {IStream} pIStream 
     * @param {Pointer<IWICMetadataReader>} ppIReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareaderfromcontainer
     */
    CreateMetadataReaderFromContainer(guidContainerFormat, pguidVendor, dwOptions, pIStream, ppIReader) {
        result := ComCall(29, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", ppIReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwMetadataOptions 
     * @param {Pointer<IWICMetadataWriter>} ppIWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriter
     */
    CreateMetadataWriter(guidMetadataFormat, pguidVendor, dwMetadataOptions, ppIWriter) {
        result := ComCall(30, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwMetadataOptions, "ptr*", ppIWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICMetadataReader} pIReader 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICMetadataWriter>} ppIWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriterfromreader
     */
    CreateMetadataWriterFromReader(pIReader, pguidVendor, ppIWriter) {
        result := ComCall(31, this, "ptr", pIReader, "ptr", pguidVendor, "ptr*", ppIWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICMetadataBlockReader} pIBlockReader 
     * @param {Pointer<IWICMetadataQueryReader>} ppIQueryReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createqueryreaderfromblockreader
     */
    CreateQueryReaderFromBlockReader(pIBlockReader, ppIQueryReader) {
        result := ComCall(32, this, "ptr", pIBlockReader, "ptr*", ppIQueryReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICMetadataBlockWriter} pIBlockWriter 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIQueryWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createquerywriterfromblockwriter
     */
    CreateQueryWriterFromBlockWriter(pIBlockWriter, ppIQueryWriter) {
        result := ComCall(33, this, "ptr", pIBlockWriter, "ptr*", ppIQueryWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPBAG2>} ppropOptions 
     * @param {Integer} cCount 
     * @param {Pointer<IPropertyBag2>} ppIPropertyBag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createencoderpropertybag
     */
    CreateEncoderPropertyBag(ppropOptions, cCount, ppIPropertyBag) {
        result := ComCall(34, this, "ptr", ppropOptions, "uint", cCount, "ptr*", ppIPropertyBag, "HRESULT")
        return result
    }
}
