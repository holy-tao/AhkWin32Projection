#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICImagingFactory.ahk" { IWICImagingFactory }
#Import ".\IWICMetadataWriter.ahk" { IWICMetadataWriter }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IWICMetadataQueryWriter.ahk" { IWICMetadataQueryWriter }
#Import ".\IWICMetadataQueryReader.ahk" { IWICMetadataQueryReader }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\StructuredStorage\PROPBAG2.ahk" { PROPBAG2 }
#Import ".\IWICMetadataReader.ahk" { IWICMetadataReader }
#Import ".\IWICMetadataBlockReader.ahk" { IWICMetadataBlockReader }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag2.ahk" { IPropertyBag2 }
#Import ".\IWICMetadataBlockWriter.ahk" { IWICMetadataBlockWriter }

/**
 * Exposes methods that create components used by component developers. This includes metadata readers, writers and other services for use by codec and metadata handler developers.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwiccomponentfactory
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICComponentFactory extends IWICImagingFactory {
    /**
     * The interface identifier for IWICComponentFactory
     * @type {Guid}
     */
    static IID := Guid("{412d0c3a-9650-44fa-af5b-dd2a06c8e8fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICComponentFactory interfaces
    */
    struct Vtbl extends IWICImagingFactory.Vtbl {
        CreateMetadataReader              : IntPtr
        CreateMetadataReaderFromContainer : IntPtr
        CreateMetadataWriter              : IntPtr
        CreateMetadataWriterFromReader    : IntPtr
        CreateQueryReaderFromBlockReader  : IntPtr
        CreateQueryWriterFromBlockWriter  : IntPtr
        CreateEncoderPropertyBag          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICComponentFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IWICMetadataReader based on the given parameters. (IWICComponentFactory.CreateMetadataReader)
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareader
     */
    CreateMetadataReader(guidMetadataFormat, pguidVendor, dwOptions, pIStream) {
        result := ComCall(28, this, Guid.Ptr, guidMetadataFormat, Guid.Ptr, pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", &ppIReader := 0, "HRESULT")
        return IWICMetadataReader(ppIReader)
    }

    /**
     * Creates an IWICMetadataReader based on the given parameters. (IWICComponentFactory.CreateMetadataReaderFromContainer)
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareaderfromcontainer
     */
    CreateMetadataReaderFromContainer(guidContainerFormat, pguidVendor, dwOptions, pIStream) {
        result := ComCall(29, this, Guid.Ptr, guidContainerFormat, Guid.Ptr, pguidVendor, "uint", dwOptions, "ptr", pIStream, "ptr*", &ppIReader := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriter
     */
    CreateMetadataWriter(guidMetadataFormat, pguidVendor, dwMetadataOptions) {
        result := ComCall(30, this, Guid.Ptr, guidMetadataFormat, Guid.Ptr, pguidVendor, "uint", dwMetadataOptions, "ptr*", &ppIWriter := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriterfromreader
     */
    CreateMetadataWriterFromReader(pIReader, pguidVendor) {
        result := ComCall(31, this, "ptr", pIReader, Guid.Ptr, pguidVendor, "ptr*", &ppIWriter := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createqueryreaderfromblockreader
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createquerywriterfromblockwriter
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createencoderpropertybag
     */
    CreateEncoderPropertyBag(ppropOptions, cCount) {
        result := ComCall(34, this, PROPBAG2.Ptr, ppropOptions, "uint", cCount, "ptr*", &ppIPropertyBag := 0, "HRESULT")
        return IPropertyBag2(ppIPropertyBag)
    }

    Query(iid) {
        if (IWICComponentFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMetadataReader := CallbackCreate(GetMethod(implObj, "CreateMetadataReader"), flags, 6)
        this.vtbl.CreateMetadataReaderFromContainer := CallbackCreate(GetMethod(implObj, "CreateMetadataReaderFromContainer"), flags, 6)
        this.vtbl.CreateMetadataWriter := CallbackCreate(GetMethod(implObj, "CreateMetadataWriter"), flags, 5)
        this.vtbl.CreateMetadataWriterFromReader := CallbackCreate(GetMethod(implObj, "CreateMetadataWriterFromReader"), flags, 4)
        this.vtbl.CreateQueryReaderFromBlockReader := CallbackCreate(GetMethod(implObj, "CreateQueryReaderFromBlockReader"), flags, 3)
        this.vtbl.CreateQueryWriterFromBlockWriter := CallbackCreate(GetMethod(implObj, "CreateQueryWriterFromBlockWriter"), flags, 3)
        this.vtbl.CreateEncoderPropertyBag := CallbackCreate(GetMethod(implObj, "CreateEncoderPropertyBag"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMetadataReader)
        CallbackFree(this.vtbl.CreateMetadataReaderFromContainer)
        CallbackFree(this.vtbl.CreateMetadataWriter)
        CallbackFree(this.vtbl.CreateMetadataWriterFromReader)
        CallbackFree(this.vtbl.CreateQueryReaderFromBlockReader)
        CallbackFree(this.vtbl.CreateQueryWriterFromBlockWriter)
        CallbackFree(this.vtbl.CreateEncoderPropertyBag)
    }
}
