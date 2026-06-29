#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import ".\IXpsOMPrintTicketResource.ahk" { IXpsOMPrintTicketResource }
#Import ".\IXpsOMObjectFactory.ahk" { IXpsOMObjectFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPackageWriter.ahk" { IXpsOMPackageWriter }
#Import ".\IXpsOMImageResource.ahk" { IXpsOMImageResource }
#Import ".\XPS_SIZE.ahk" { XPS_SIZE }
#Import ".\IXpsOMCoreProperties.ahk" { IXpsOMCoreProperties }
#Import ".\XPS_INTERLEAVING.ahk" { XPS_INTERLEAVING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IXpsOMPackage1.ahk" { IXpsOMPackage1 }
#Import ".\IXpsOMPage1.ahk" { IXpsOMPage1 }
#Import ".\IXpsOMPartResources.ahk" { IXpsOMPartResources }
#Import ".\IXpsOMRemoteDictionaryResource.ahk" { IXpsOMRemoteDictionaryResource }
#Import "..\..\System\Com\ISequentialStream.ahk" { ISequentialStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\XPS_DOCUMENT_TYPE.ahk" { XPS_DOCUMENT_TYPE }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }

/**
 * Inherits from IXpsOMObjectFactory.
 * @remarks
 * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
 * The base interface is defined and documented in Windows 7 SDK.
 * 
 * [IXpsOMObjectFactory interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsomobjectfactory1
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMObjectFactory1 extends IXpsOMObjectFactory {
    /**
     * The interface identifier for IXpsOMObjectFactory1
     * @type {Guid}
     */
    static IID := Guid("{0a91b617-d612-4181-bf7c-be5824e9cc8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMObjectFactory1 interfaces
    */
    struct Vtbl extends IXpsOMObjectFactory.Vtbl {
        GetDocumentTypeFromFile                   : IntPtr
        GetDocumentTypeFromStream                 : IntPtr
        ConvertHDPhotoToJpegXR                    : IntPtr
        ConvertJpegXRToHDPhoto                    : IntPtr
        CreatePackageWriterOnFile1                : IntPtr
        CreatePackageWriterOnStream1              : IntPtr
        CreatePackage1                            : IntPtr
        CreatePackageFromStream1                  : IntPtr
        CreatePackageFromFile1                    : IntPtr
        CreatePage1                               : IntPtr
        CreatePageFromStream1                     : IntPtr
        CreateRemoteDictionaryResourceFromStream1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMObjectFactory1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Detects the type of XPS document that is stored in the specified file.
     * @remarks
     * This method only parses the data enough to detect the document type. It does not validate the content. A return value of S_OK does not, therefore, imply that the file contains a valid document.
     * @param {PWSTR} filename [in] The name of the  XPS file from which to get the type.
     * @returns {XPS_DOCUMENT_TYPE} [out, retval] The document type.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromfile
     */
    GetDocumentTypeFromFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(40, this, "ptr", filename, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Detects the type of XPS document that is stored in the specified stream.
     * @remarks
     * This method only parses the data enough to detect the document type. It does not validate the content. A return value of S_OK does not, therefore, imply that the stream contains a valid document.
     * @param {IStream} xpsDocumentStream [in] A stream that contains XPS OM data. The stream must support sequential reading and the read position of the stream must be set to the beginning of the XPS data.
     * @returns {XPS_DOCUMENT_TYPE} [out, retval] The document type of the XPS data found in the stream.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromstream
     */
    GetDocumentTypeFromStream(xpsDocumentStream) {
        result := ComCall(41, this, "ptr", xpsDocumentStream, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Converts an image resource from an HD Photo to a JpegXR.
     * @remarks
     * This image referenced by imageResource is changed from an XPS_IMAGE_TYPE_WDP image type to an XPS_IMAGE_TYPE_JPEGXR image type. This method converts the data stream of the image resource;, however, the part name of the resource remains the same.
     * @param {IXpsOMImageResource} imageResource [in, out] The image resource to convert. 
     * 
     * When the method returns, the converted image resource.
     * @returns {HRESULT} Possible values include, but are not limited to, the following. For information about XPS document API return values that are not listed here, see XPS Document Errors.
     * 
     * S_OK: The method succeeded. 
     * 
     * XPS_E_INVALID_CONTENT_TYPE: The image type is not XPS_IMAGE_TYPE_WDP.
     * 
     *  E_INVALIDARG: The image resource is not recognized by the WDP decoder or another general error occurred.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-converthdphototojpegxr
     */
    ConvertHDPhotoToJpegXR(imageResource) {
        result := ComCall(42, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Converts an image resource from a JpegXR to an HD Photo.
     * @remarks
     * This image referenced by imageResource is changed from an XPS_IMAGE_TYPE_JPEGXR image type to an XPS_IMAGE_TYPE_WDP image type. This method converts the data stream of the image resource;, however, the part name of the resource remains the same.
     * @param {IXpsOMImageResource} imageResource [in, out] The image resource to convert. 
     * 
     * When the method returns, the converted image resource.
     * @returns {HRESULT} Possible values include, but are not limited to, the following. For information about XPS document API return values that are not listed here, see XPS Document Errors.
     * 
     * S_OK: The method succeeded. 
     * 
     * XPS_E_INVALID_CONTENT_TYPE: The image type is not XPS_IMAGE_TYPE_JXR.
     * 
     * E_INVALIDARG if data is not recognized by WDP decoder or another error occurred.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-convertjpegxrtohdphoto
     */
    ConvertJpegXRToHDPhoto(imageResource) {
        result := ComCall(43, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Opens a file for writing the contents of an XPS OM to an XPS package of a specified type. This method produces a package writer for either an MSXPS document or an OpenXPS document.
     * @remarks
     * Use this method to produce a package writer for either an MSXPS document or an OpenXPS document. <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronfile">CreatePackageWriterOnFile</a>,  released in Windows 7, only creates XPS document files in the MSXPS format.
     * 
     * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
     * Additional References: Legacy method description
     * @param {PWSTR} fileName [in] The name of the file to be created.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes [in, unique]    The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure, which contains two separate but related  members:
     * 
     * <ul>
     * <li><b>lpSecurityDescriptor</b>: an optional security descriptor</li>
     * <li><b>bInheritHandle</b>:  a Boolean value that determines whether the returned handle can be inherited by child processes</li>
     * </ul>
     * If  <b>lpSecurityDescriptor</b> is <b>NULL</b>, the file or device associated with the returned handle is assigned a default security descriptor.
     * 
     *  For more information about <i>securityAttributes</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @param {Integer} flagsAndAttributes [in]            Specifies the settings and attributes of the file to be created. For most files, the <b>FILE_ATTRIBUTE_NORMAL</b> value can be used.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> for more information about this parameter.
     * @param {BOOL} optimizeMarkupSize [in] A Boolean value that  indicates whether the document markup will be optimized for size when the contents of the XPS OM are written to the XPS package.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will try to optimize the markup for minimum size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will not try to perform any optimization.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {XPS_INTERLEAVING} interleaving [in] Specifies whether the content of the XPS OM will be interleaved when it is written to the file.
     * @param {IOpcPartUri} documentSequencePartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part. This parameter can be set to <b>NULL</b>.
     * @param {XPS_DOCUMENT_TYPE} documentType [in] Specifies the document type of the package writer. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {IXpsOMPackageWriter} [out, retval]    A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronfile1
     */
    CreatePackageWriterOnFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(44, this, "ptr", fileName, SECURITY_ATTRIBUTES.Ptr, securityAttributes, "uint", flagsAndAttributes, BOOL, optimizeMarkupSize, XPS_INTERLEAVING, interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, XPS_DOCUMENT_TYPE, documentType, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Opens a stream for writing the contents of an XPS OM to an XPS package of a specified type.
     * @remarks
     * Use this method to produce a package writer for either an MSXPS document or an OpenXPS document. <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronstream">CreatePackageWriterOnStream</a>,  released in Windows 7, only creates XPS document files in the MSXPS format.
     * @param {ISequentialStream} outputStream [in] The stream to be used for writing.
     * @param {BOOL} optimizeMarkupSize A Boolean value that  indicates whether the document markup will be optimized for size when the document is written to the stream.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When writing to the stream, the package writer will attempt to optimize the markup for minimum size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When writing to the package, the package writer will not attempt any optimization.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {XPS_INTERLEAVING} interleaving [in] Specifies whether the content of the XPS OM will be interleaved when it is written to the stream.
     * @param {IOpcPartUri} documentSequencePartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part.  This parameter can be set to <b>NULL</b>.
     * @param {XPS_DOCUMENT_TYPE} documentType [in] The document type of the package writer. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {IXpsOMPackageWriter} [out, retval]    A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronstream1
     */
    CreatePackageWriterOnStream1(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType) {
        result := ComCall(45, this, "ptr", outputStream, BOOL, optimizeMarkupSize, XPS_INTERLEAVING, interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, XPS_DOCUMENT_TYPE, documentType, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * 
     * @returns {IXpsOMPackage1} 
     */
    CreatePackage1() {
        result := ComCall(46, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage1(package)
    }

    /**
     * Opens a stream that contains an XPS package and returns an instantiated XPS document object tree.
     * @remarks
     * Use this method to read a stream that contains an XPS document that could be of type XPS_DOCUMENT_TYPE_ XPS or XPS_DOCUMENT_TYPE_ OPENXPS.   <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromstream">CreatePackageFromStream</a>, released in Windows 7, only opens streams that contain an XPS document of type XPS_DOCUMENT_TYPE_ XPS.
     * @param {IStream} stream [in] The stream that contains an XPS package.
     * @param {BOOL} reuseObjects [in]            The Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPackage1} [out, retval]   A pointer to the new IXpsOMPackage1 interface that contains the resulting XPS document object tree.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromstream1
     */
    CreatePackageFromStream1(stream, reuseObjects) {
        result := ComCall(47, this, "ptr", stream, BOOL, reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage1(package)
    }

    /**
     * Opens an XPS package file and returns an instantiated XPS document object tree. This method will read a file that contains an XPS document that is of type XPS_DOCUMENT_TYPE_ XPS or XPS_DOCUMENT_TYPE_ OPENXPS.
     * @remarks
     * Use this method to read a file that contains an XPS document that could be of type XPS_DOCUMENT_TYPE_ XPS or XPS_DOCUMENT_TYPE_ OPENXPS.   <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromfile">CreatePackageFromFile</a>, released in Windows 7, only opens files that contain an XPS document of type XPS_DOCUMENT_TYPE_ XPS.
     * @param {PWSTR} filename [in, string] The name of the XPS package file.
     * @param {BOOL} reuseObjects [in]            The Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPackage1} [out, retval]   A pointer to the new IXpsOMPackage1 interface that contains the XPS document object tree that was read from filename.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromfile1
     */
    CreatePackageFromFile1(filename, reuseObjects) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(48, this, "ptr", filename, BOOL, reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage1(package)
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMPage1} 
     */
    CreatePage1(pageDimensions, language, partUri) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(49, this, XPS_SIZE.Ptr, pageDimensions, "ptr", language, "ptr", partUri, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage1(page)
    }

    /**
     * Reads the page markup from the specified stream to create and populate an IXpsOMPage1 interface.
     * @remarks
     * The IXpsOMPage1 interface returned by this method provides a GetDocumentType method that can be used to identify the XPS document type of the source XML markup in the stream. XPS document type determination is based on the XML namespaces that are used in source markup.
     * 
     * An IXpsOMPage1 interface that contains a document type of XPS_DOCUMENT_TYPE_ OPENXPS can be serialized as a document type of XPS_DOCUMENT_TYPE_ XPS if all of its image resources are compatible with the XPS_DOCUMENT_TYPE_ XPS document format.
     * @param {IStream} pageMarkupStream [in]            The stream that contains the page markup.
     * @param {IOpcPartUri} partUri [in]            The IOpcPartUri interface that contains the page's URI.
     * @param {IXpsOMPartResources} resources [in]            The IXpsOMPartResources interface that contains the resources used by the page.
     * @param {BOOL} reuseObjects [in]            A Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPage1} [out, retval]   A pointer to the new IXpsOMPage1 interface created by this method. -
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpagefromstream1
     */
    CreatePageFromStream1(pageMarkupStream, partUri, resources, reuseObjects) {
        result := ComCall(50, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, BOOL, reuseObjects, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage1(page)
    }

    /**
     * Loads the remote resource dictionary markup into an unrooted IXpsOMRemoteDictionaryResource interface. The dictionary referenced by the dictionaryMarkupStream parameter can contain markup from either the OpenXPS or the MSXPS namespace.
     * @remarks
     * Use this method to create a remote dictionary from a stream whose contents could be of type XPS_DOCUMENT_TYPE_ XPS or XPS_DOCUMENT_TYPE_ OPENXPS.   CreateRemoteDictionaryResourceFromStream, released in Windows 7, only reads streams of type XPS_DOCUMENT_TYPE_ XPS.
     * @param {IStream} dictionaryMarkupStream [in]            The IStream interface that contains the remote resource dictionary markup.
     * @param {IOpcPartUri} partUri [in]            The IOpcPartUri interface that contains the part name to be assigned to this resource.
     * @param {IXpsOMPartResources} resources The IXpsOMPartResources interface for the part resources of the dictionary resource objects that have streams.
     * @returns {IXpsOMRemoteDictionaryResource} [in]            A pointer to the new IXpsOMRemoteDictionaryResource interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createremotedictionaryresourcefromstream1
     */
    CreateRemoteDictionaryResourceFromStream1(dictionaryMarkupStream, partUri, resources) {
        result := ComCall(51, this, "ptr", dictionaryMarkupStream, "ptr", partUri, "ptr", resources, "ptr*", &dictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(dictionaryResource)
    }

    Query(iid) {
        if (IXpsOMObjectFactory1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentTypeFromFile := CallbackCreate(GetMethod(implObj, "GetDocumentTypeFromFile"), flags, 3)
        this.vtbl.GetDocumentTypeFromStream := CallbackCreate(GetMethod(implObj, "GetDocumentTypeFromStream"), flags, 3)
        this.vtbl.ConvertHDPhotoToJpegXR := CallbackCreate(GetMethod(implObj, "ConvertHDPhotoToJpegXR"), flags, 2)
        this.vtbl.ConvertJpegXRToHDPhoto := CallbackCreate(GetMethod(implObj, "ConvertJpegXRToHDPhoto"), flags, 2)
        this.vtbl.CreatePackageWriterOnFile1 := CallbackCreate(GetMethod(implObj, "CreatePackageWriterOnFile1"), flags, 13)
        this.vtbl.CreatePackageWriterOnStream1 := CallbackCreate(GetMethod(implObj, "CreatePackageWriterOnStream1"), flags, 11)
        this.vtbl.CreatePackage1 := CallbackCreate(GetMethod(implObj, "CreatePackage1"), flags, 2)
        this.vtbl.CreatePackageFromStream1 := CallbackCreate(GetMethod(implObj, "CreatePackageFromStream1"), flags, 4)
        this.vtbl.CreatePackageFromFile1 := CallbackCreate(GetMethod(implObj, "CreatePackageFromFile1"), flags, 4)
        this.vtbl.CreatePage1 := CallbackCreate(GetMethod(implObj, "CreatePage1"), flags, 5)
        this.vtbl.CreatePageFromStream1 := CallbackCreate(GetMethod(implObj, "CreatePageFromStream1"), flags, 6)
        this.vtbl.CreateRemoteDictionaryResourceFromStream1 := CallbackCreate(GetMethod(implObj, "CreateRemoteDictionaryResourceFromStream1"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentTypeFromFile)
        CallbackFree(this.vtbl.GetDocumentTypeFromStream)
        CallbackFree(this.vtbl.ConvertHDPhotoToJpegXR)
        CallbackFree(this.vtbl.ConvertJpegXRToHDPhoto)
        CallbackFree(this.vtbl.CreatePackageWriterOnFile1)
        CallbackFree(this.vtbl.CreatePackageWriterOnStream1)
        CallbackFree(this.vtbl.CreatePackage1)
        CallbackFree(this.vtbl.CreatePackageFromStream1)
        CallbackFree(this.vtbl.CreatePackageFromFile1)
        CallbackFree(this.vtbl.CreatePage1)
        CallbackFree(this.vtbl.CreatePageFromStream1)
        CallbackFree(this.vtbl.CreateRemoteDictionaryResourceFromStream1)
    }
}
