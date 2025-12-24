#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICMetadataReader.ahk
#Include .\IWICMetadataWriter.ahk
#Include .\IWICMetadataQueryReader.ahk
#Include .\IWICMetadataQueryWriter.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyBag2.ahk
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
     * Creates an IWICMetadataReader based on the given parameters.
     * @param {Pointer<Guid>} guidMetadataFormat Type: <b>REFGUID</b>
     * 
     * The GUID of the desired metadata format.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the GUID of the desired metadata reader vendor.
     * @param {Integer} dwOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions">WICMetadataCreationOptions</a> options to use when creating the metadata reader.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to a stream in which to initialize the reader with. If <b>NULL</b>, the metadata reader will be empty.
     * @returns {IWICMetadataReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata reader.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareader
     */
    CreateMetadataReader(guidMetadataFormat, pguidVendor, dwOptions, pIStream) {
        result := ComCall(28, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", &ppIReader := 0, "HRESULT")
        return IWICMetadataReader(ppIReader)
    }

    /**
     * Creates an IWICMetadataReader based on the given parameters.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format GUID to base the reader on.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the vendor GUID of the metadata reader.
     * @param {Integer} dwOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions">WICMetadataCreationOptions</a> options to use when creating the metadata reader.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to a stream in which to initialize the reader with. If <b>NULL</b>, the metadata reader will be empty.
     * @returns {IWICMetadataReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata reader
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareaderfromcontainer
     */
    CreateMetadataReaderFromContainer(guidContainerFormat, pguidVendor, dwOptions, pIStream) {
        result := ComCall(29, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", &ppIReader := 0, "HRESULT")
        return IWICMetadataReader(ppIReader)
    }

    /**
     * Creates an IWICMetadataWriter based on the given parameters.
     * @param {Pointer<Guid>} guidMetadataFormat Type: <b>REFGUID</b>
     * 
     * The GUID of the desired metadata format.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the GUID of the desired metadata reader vendor.
     * @param {Integer} dwMetadataOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicmetadatacreationoptions">WICMetadataCreationOptions</a> options to use when creating the metadata reader.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriter
     */
    CreateMetadataWriter(guidMetadataFormat, pguidVendor, dwMetadataOptions) {
        result := ComCall(30, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "uint", dwMetadataOptions, "ptr*", &ppIWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIWriter)
    }

    /**
     * Creates an IWICMetadataWriter from the given IWICMetadataReader.
     * @param {IWICMetadataReader} pIReader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>*</b>
     * 
     * Pointer to the metadata reader to base the metadata writer on.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the GUID of the desired metadata reader vendor.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriterfromreader
     */
    CreateMetadataWriterFromReader(pIReader, pguidVendor) {
        result := ComCall(31, this, "ptr", pIReader, "ptr", pguidVendor, "ptr*", &ppIWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIWriter)
    }

    /**
     * Creates a IWICMetadataQueryReader from the given IWICMetadataBlockReader.
     * @param {IWICMetadataBlockReader} pIBlockReader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a>*</b>
     * 
     * Pointer to the block reader to base the query reader on.
     * @returns {IWICMetadataQueryReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata query reader.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createqueryreaderfromblockreader
     */
    CreateQueryReaderFromBlockReader(pIBlockReader) {
        result := ComCall(32, this, "ptr", pIBlockReader, "ptr*", &ppIQueryReader := 0, "HRESULT")
        return IWICMetadataQueryReader(ppIQueryReader)
    }

    /**
     * Creates a IWICMetadataQueryWriter from the given IWICMetadataBlockWriter.
     * @param {IWICMetadataBlockWriter} pIBlockWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter">IWICMetadataBlockWriter</a>*</b>
     * 
     * Pointer to the metadata block reader to base the metadata query writer on.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * A pointer that receives a pointer to the new metadata query writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createquerywriterfromblockwriter
     */
    CreateQueryWriterFromBlockWriter(pIBlockWriter) {
        result := ComCall(33, this, "ptr", pIBlockWriter, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }

    /**
     * Creates an encoder property bag.
     * @param {Pointer<PROPBAG2>} ppropOptions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768188(v=vs.85)">PROPBAG2</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768188(v=vs.85)">PROPBAG2</a> options used to create the encoder property bag.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768188(v=vs.85)">PROPBAG2</a> structures in the <i>ppropOptions</i> array.
     * @returns {IPropertyBag2} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>**</b>
     * 
     * A pointer that receives a pointer to an encoder <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createencoderpropertybag
     */
    CreateEncoderPropertyBag(ppropOptions, cCount) {
        result := ComCall(34, this, "ptr", ppropOptions, "uint", cCount, "ptr*", &ppIPropertyBag := 0, "HRESULT")
        return IPropertyBag2(ppIPropertyBag)
    }
}
