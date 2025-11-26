#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackageWriter.ahk
#Include .\IXpsOMPackage1.ahk
#Include .\IXpsOMPage1.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMObjectFactory.ahk

/**
 * Inherits from IXpsOMObjectFactory.
 * @remarks
 * 
 * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
 * The base interface is defined and documented in Windows 7 SDK.
 * 
 * [IXpsOMObjectFactory interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsomobjectfactory1
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMObjectFactory1 extends IXpsOMObjectFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMObjectFactory1
     * @type {Guid}
     */
    static IID => Guid("{0a91b617-d612-4181-bf7c-be5824e9cc8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentTypeFromFile", "GetDocumentTypeFromStream", "ConvertHDPhotoToJpegXR", "ConvertJpegXRToHDPhoto", "CreatePackageWriterOnFile1", "CreatePackageWriterOnStream1", "CreatePackage1", "CreatePackageFromStream1", "CreatePackageFromFile1", "CreatePage1", "CreatePageFromStream1", "CreateRemoteDictionaryResourceFromStream1"]

    /**
     * Detects the type of XPS document that is stored in the specified file.
     * @param {PWSTR} filename [in] The name of the  XPS file from which to get the type.
     * @returns {Integer} [out, retval] The document type.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromfile
     */
    GetDocumentTypeFromFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(40, this, "ptr", filename, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Detects the type of XPS document that is stored in the specified stream.
     * @param {IStream} xpsDocumentStream [in] A stream that contains XPS OM data. The stream must support sequential reading and the read position of the stream must be set to the beginning of the XPS data.
     * @returns {Integer} [out, retval] The document type of the XPS data found in the stream.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromstream
     */
    GetDocumentTypeFromStream(xpsDocumentStream) {
        result := ComCall(41, this, "ptr", xpsDocumentStream, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Converts an image resource from an HD Photo to a JpegXR.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-converthdphototojpegxr
     */
    ConvertHDPhotoToJpegXR(imageResource) {
        result := ComCall(42, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Converts an image resource from a JpegXR to an HD Photo.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-convertjpegxrtohdphoto
     */
    ConvertJpegXRToHDPhoto(imageResource) {
        result := ComCall(43, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Opens a file for writing the contents of an XPS OM to an XPS package of a specified type. This method produces a package writer for either an MSXPS document or an OpenXPS document.
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
     * @param {Integer} interleaving [in] Specifies whether the content of the XPS OM will be interleaved when it is written to the file.
     * @param {IOpcPartUri} documentSequencePartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part. This parameter can be set to <b>NULL</b>.
     * @param {Integer} documentType [in] Specifies the document type of the package writer. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {IXpsOMPackageWriter} [out, retval]    A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronfile1
     */
    CreatePackageWriterOnFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(44, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Opens a stream for writing the contents of an XPS OM to an XPS package of a specified type.
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
     * @param {Integer} interleaving [in] Specifies whether the content of the XPS OM will be interleaved when it is written to the stream.
     * @param {IOpcPartUri} documentSequencePartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket [in] The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName [in] The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part.  This parameter can be set to <b>NULL</b>.
     * @param {Integer} documentType [in] The document type of the package writer. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {IXpsOMPackageWriter} [out, retval]    A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronstream1
     */
    CreatePackageWriterOnStream1(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType) {
        result := ComCall(45, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr*", &packageWriter := 0, "HRESULT")
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
     * @param {IStream} stream [in] The stream that contains an XPS package.
     * @param {BOOL} reuseObjects [in]            The Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPackage1} [out, retval]   A pointer to the new IXpsOMPackage1 interface that contains the resulting XPS document object tree.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromstream1
     */
    CreatePackageFromStream1(stream, reuseObjects) {
        result := ComCall(47, this, "ptr", stream, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage1(package)
    }

    /**
     * Opens an XPS package file and returns an instantiated XPS document object tree. This method will read a file that contains an XPS document that is of type XPS_DOCUMENT_TYPE_ XPS or XPS_DOCUMENT_TYPE_ OPENXPS.
     * @param {PWSTR} filename [in, string] The name of the XPS package file.
     * @param {BOOL} reuseObjects [in]            The Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPackage1} [out, retval]   A pointer to the new IXpsOMPackage1 interface that contains the XPS document object tree that was read from filename.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromfile1
     */
    CreatePackageFromFile1(filename, reuseObjects) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(48, this, "ptr", filename, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
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

        result := ComCall(49, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage1(page)
    }

    /**
     * Reads the page markup from the specified stream to create and populate an IXpsOMPage1 interface.
     * @param {IStream} pageMarkupStream [in]            The stream that contains the page markup.
     * @param {IOpcPartUri} partUri [in]            The IOpcPartUri interface that contains the page's URI.
     * @param {IXpsOMPartResources} resources [in]            The IXpsOMPartResources interface that contains the resources used by the page.
     * @param {BOOL} reuseObjects [in]            A Boolean value that indicates that the software is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
     * 
     * TRUE: The software will attempt to optimize the object tree.
     * 
     * FALSE: The software will not attempt to optimize the object tree.
     * @returns {IXpsOMPage1} [out, retval]   A pointer to the new IXpsOMPage1 interface created by this method. -
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpagefromstream1
     */
    CreatePageFromStream1(pageMarkupStream, partUri, resources, reuseObjects) {
        result := ComCall(50, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage1(page)
    }

    /**
     * Loads the remote resource dictionary markup into an unrooted IXpsOMRemoteDictionaryResource interface. The dictionary referenced by the dictionaryMarkupStream parameter can contain markup from either the OpenXPS or the MSXPS namespace.
     * @param {IStream} dictionaryMarkupStream [in]            The IStream interface that contains the remote resource dictionary markup.
     * @param {IOpcPartUri} partUri [in]            The IOpcPartUri interface that contains the part name to be assigned to this resource.
     * @param {IXpsOMPartResources} resources The IXpsOMPartResources interface for the part resources of the dictionary resource objects that have streams.
     * @returns {IXpsOMRemoteDictionaryResource} [in]            A pointer to the new IXpsOMRemoteDictionaryResource interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createremotedictionaryresourcefromstream1
     */
    CreateRemoteDictionaryResourceFromStream1(dictionaryMarkupStream, partUri, resources) {
        result := ComCall(51, this, "ptr", dictionaryMarkupStream, "ptr", partUri, "ptr", resources, "ptr*", &dictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(dictionaryResource)
    }
}
