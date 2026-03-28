#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackage.ahk
#Include .\IXpsOMStoryFragmentsResource.ahk
#Include .\IXpsOMDocumentStructureResource.ahk
#Include .\IXpsOMSignatureBlockResource.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMPartResources.ahk
#Include .\IXpsOMDocumentSequence.ahk
#Include .\IXpsOMDocument.ahk
#Include .\IXpsOMPageReference.ahk
#Include .\IXpsOMPage.ahk
#Include .\IXpsOMCanvas.ahk
#Include .\IXpsOMGlyphs.ahk
#Include .\IXpsOMPath.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMGeometryFigure.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMSolidColorBrush.ahk
#Include .\IXpsOMColorProfileResource.ahk
#Include .\IXpsOMImageBrush.ahk
#Include .\IXpsOMVisualBrush.ahk
#Include .\IXpsOMImageResource.ahk
#Include .\IXpsOMPrintTicketResource.ahk
#Include .\IXpsOMFontResource.ahk
#Include .\IXpsOMGradientStop.ahk
#Include .\IXpsOMLinearGradientBrush.ahk
#Include .\IXpsOMRadialGradientBrush.ahk
#Include .\IXpsOMCoreProperties.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMPartUriCollection.ahk
#Include .\IXpsOMPackageWriter.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates objects in the XPS document object model.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMObjectFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMObjectFactory
     * @type {Guid}
     */
    static IID => Guid("{f9b2a685-a50d-4fc2-b764-b56e093ea0ca}")

    /**
     * The class identifier for XpsOMObjectFactory
     * @type {Guid}
     */
    static CLSID => Guid("{e974d26d-3d9b-4d47-88cc-3872f2dc3585}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackage", "CreatePackageFromFile", "CreatePackageFromStream", "CreateStoryFragmentsResource", "CreateDocumentStructureResource", "CreateSignatureBlockResource", "CreateRemoteDictionaryResource", "CreateRemoteDictionaryResourceFromStream", "CreatePartResources", "CreateDocumentSequence", "CreateDocument", "CreatePageReference", "CreatePage", "CreatePageFromStream", "CreateCanvas", "CreateGlyphs", "CreatePath", "CreateGeometry", "CreateGeometryFigure", "CreateMatrixTransform", "CreateSolidColorBrush", "CreateColorProfileResource", "CreateImageBrush", "CreateVisualBrush", "CreateImageResource", "CreatePrintTicketResource", "CreateFontResource", "CreateGradientStop", "CreateLinearGradientBrush", "CreateRadialGradientBrush", "CreateCoreProperties", "CreateDictionary", "CreatePartUriCollection", "CreatePackageWriterOnFile", "CreatePackageWriterOnStream", "CreatePartUri", "CreateReadOnlyStreamOnFile"]

    /**
     * Creates an IXpsOMPackage interface that serves as the root node of an XPS object model document tree.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMPackage    *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *       __uuidof(XpsOMObjectFactory),
     *       NULL, 
     *       CLSCTX_INPROC_SERVER,
     *       __uuidof(IXpsOMObjectFactory),
     *       reinterpret_cast<LPVOID*>(&xpsFactory)
     *       );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePackage (&newInterface);
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     * 
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * 
     * 
     * For information about using <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a>.
     * @returns {IXpsOMPackage} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackage
     */
    CreatePackage() {
        result := ComCall(3, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Opens an XPS package file and returns an instantiated XPS document object tree.
     * @remarks
     * This method does not validate the contents of any stream-based resources that it loads from the stream  into the  objects of the XPS OM. Instead, the application must validate these resources before it uses them.
     * 
     * This method does not deserialize the document pages; it only deserializes the XPS package down to the page reference parts. The actual pages can be deserialized as they are needed, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">IXpsOMPageReference::GetPage</a> method. Because the pages are not deserialized when   <b>GetPage</b>  is called, it is possible for this method to return S_OK or, if an attempt is made to load a problematic page  in an XPS package, to return an error.
     * 
     * If you write an XPS OM immediately after you have read an XPS package into it, some of the original content might be lost or changed.
     * 
     * Some of the changes that can occur in such a case are listed in the table that follows:<table>
     * <tr>
     * <th>Document feature</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * Digital signatures
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DiscardControl part
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Foreign document parts
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FixedPage markup
     * 
     * </td>
     * <td>
     * Modified from original
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resource dictionary markup
     * 
     * </td>
     * <td>
     * Modified from original if Optimization flag is set
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For information about using <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a>.
     * @param {PWSTR} filename The name of the XPS package file.
     * @param {BOOL} reuseObjects A Boolean value that indicates whether  the software  is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
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
     * The software will attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The software will not attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IXpsOMPackage} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the resulting XPS document object tree.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromfile
     */
    CreatePackageFromFile(filename, reuseObjects) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(4, this, "ptr", filename, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Opens a stream that contains an XPS package, and returns an instantiated XPS document object tree.
     * @remarks
     * This method does not validate the contents of any stream-based resources that it loads from the stream  into the  objects of the XPS OM. Instead, the application must validate these resources before it uses them.
     * 
     * This method does not deserialize the document pages; it only deserializes the XPS package down to the page reference parts. The actual pages can be deserialized as they are needed, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">IXpsOMPageReference::GetPage</a> method. Because the pages are not deserialized when   <b>GetPage</b>  is called, it is possible for this method to return S_OK or, if an attempt is made to load a problematic page  in an XPS package, to return an error.
     * 
     * If you write an XPS OM immediately after you have read an XPS package into it, some of the original content might be lost or changed.
     * 
     * Some of the changes that can occur in such a case are listed in the table that follows:<table>
     * <tr>
     * <th>Document feature</th>
     * <th>Action</th>
     * </tr>
     * <tr>
     * <td>
     * Digital signatures
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DiscardControl part
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Foreign document parts
     * 
     * </td>
     * <td>
     * Removed from document
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FixedPage markup
     * 
     * </td>
     * <td>
     * Modified from original
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resource dictionary markup
     * 
     * </td>
     * <td>
     * Modified from original if Optimization flag is set
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For information about using <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a>.
     * @param {IStream} stream The stream that contains an XPS package.
     * @param {BOOL} reuseObjects The  Boolean value that indicates   that the software  is to attempt to optimize the document object tree by sharing objects that are identical in all properties and children. 
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
     * The software will attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The software will not attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IXpsOMPackage} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the resulting XPS document object tree.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromstream
     */
    CreatePackageFromStream(stream, reuseObjects) {
        result := ComCall(5, this, "ptr", stream, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Creates an IXpsOMStoryFragmentsResource interface that provides access to the content of the resource stream of a page's StoryFragments part.
     * @remarks
     * The StoryFragments part of a page contains the XML markup that describes the structure of the portions of one or more stories  that are associated with a single fixed page. Some of the document contents that might be described by the XML markup in a StoryFragments part include  the story's tables and paragraphs that are found on the page.
     * 
     * The XML markup in  the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * @param {IStream} acquiredStream The read-only <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface to be associated with this StoryFragments  resource.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object; do not re-enter it.</div>
     * <div> </div>
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to  this resource.
     * @returns {IXpsOMStoryFragmentsResource} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource">IXpsOMStoryFragmentsResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createstoryfragmentsresource
     */
    CreateStoryFragmentsResource(acquiredStream, partUri) {
        result := ComCall(6, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &storyFragmentsResource := 0, "HRESULT")
        return IXpsOMStoryFragmentsResource(storyFragmentsResource)
    }

    /**
     * Creates an IXpsOMDocumentStructureResource interface, which provides access to the document structure resource stream.
     * @remarks
     * The DocumentStructure part of an XPS document contains the document outline, which, with the StoryFragments parts, defines the reading order of every element that appears in the fixed pages of the document. This interface enables a program to read the XML contents of the DocumentStructure  part and also to replace the XML contents of the DocumentStructure part.
     * 
     * The DocumentStructure part contains the document framework and the outline that describes the overall reading order of the document. The reading order is organized into semantic blocks called stories. Stories are logical units of the document in the same way as  articles are units in a magazine. Stories are made up of one or more StoryFragments parts.
     * 
     * The  StoryFragments parts contain content structure markup that defines the story's semantic blocks, such as the  paragraphs and tables that make up the story's content.
     * 
     * The content of the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * @param {IStream} acquiredStream The read-only <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>   interface to be associated with this resource. This parameter must not be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object; do not re-enter it.</div>
     * <div> </div>
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMDocumentStructureResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentstructureresource">IXpsOMDocumentStructureResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentstructureresource
     */
    CreateDocumentStructureResource(acquiredStream, partUri) {
        result := ComCall(7, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &documentStructureResource := 0, "HRESULT")
        return IXpsOMDocumentStructureResource(documentStructureResource)
    }

    /**
     * Creates an IXpsOMSignatureBlockResource that can contain one or more signature requests.
     * @param {IStream} acquiredStream A read-only stream to be associated with this resource.
     * @param {IOpcPartUri} partUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be  assigned to this resource.
     * @returns {IXpsOMSignatureBlockResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsignatureblockresource
     */
    CreateSignatureBlockResource(acquiredStream, partUri) {
        result := ComCall(8, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &signatureBlockResource := 0, "HRESULT")
        return IXpsOMSignatureBlockResource(signatureBlockResource)
    }

    /**
     * Creates an IXpsOMRemoteDictionaryResource interface that enables the sharing of property resources.
     * @param {IXpsOMDictionary} dictionary The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface pointer of the dictionary to be associated with this resource.
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource.
     * @returns {IXpsOMRemoteDictionaryResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresource
     */
    CreateRemoteDictionaryResource(dictionary, partUri) {
        result := ComCall(9, this, "ptr", dictionary, "ptr", partUri, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }

    /**
     * Loads the remote resource dictionary markup into an unrooted IXpsOMRemoteDictionaryResource interface.
     * @param {IStream} dictionaryMarkupStream The <b>IStream</b> interface that contains the remote resource dictionary markup.
     * @param {IOpcPartUri} dictionaryPartUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource.
     * @param {IXpsOMPartResources} resources The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface for the part resources of the dictionary resource objects  that have streams.
     * @returns {IXpsOMRemoteDictionaryResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresourcefromstream
     */
    CreateRemoteDictionaryResourceFromStream(dictionaryMarkupStream, dictionaryPartUri, resources) {
        result := ComCall(10, this, "ptr", dictionaryMarkupStream, "ptr", dictionaryPartUri, "ptr", resources, "ptr*", &dictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(dictionaryResource)
    }

    /**
     * Creates an IXpsOMPartResources interface that can contain part-based resources.
     * @remarks
     * The part resources are shared between pages of a document and can include fonts, images, color profiles, and remote dictionaries.
     * 
     * To find the part resources of a document, call  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectpartresources">IXpsOMPageReference::CollectPartResources</a>.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMPartResources    *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePartResources (&newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @returns {IXpsOMPartResources} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpartresources
     */
    CreatePartResources() {
        result := ComCall(11, this, "ptr*", &partResources := 0, "HRESULT")
        return IXpsOMPartResources(partResources)
    }

    /**
     * Creates an IXpsOMDocumentSequence interface, which can contain the IXpsOMDocument interfaces of the XPS document.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMDocumentSequence    *newInterface;
     * IOpcPartUri               *partUri;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
     *     
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreateDocumentSequence (partUri, &newInterface);
     * 
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IOpcPartUri} partUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMDocumentSequence} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentsequence">IXpsOMDocumentSequence</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentsequence
     */
    CreateDocumentSequence(partUri) {
        result := ComCall(12, this, "ptr", partUri, "ptr*", &documentSequence := 0, "HRESULT")
        return IXpsOMDocumentSequence(documentSequence)
    }

    /**
     * Creates an IXpsOMDocument interface, which can contain a set of IXpsOMPageReference interfaces in an ordered sequence.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMDocument    *newInterface;
     * IOpcPartUri       *partUri;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
     *     
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreateDocument (partUri, &newInterface);
     *         
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IOpcPartUri} partUri The  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMDocument} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocument
     */
    CreateDocument(partUri) {
        result := ComCall(13, this, "ptr", partUri, "ptr*", &_document := 0, "HRESULT")
        return IXpsOMDocument(_document)
    }

    /**
     * Creates an IXpsOMPageReference interface that enables the virtualization of pages.
     * @remarks
     * The use of a page reference makes it possible to delay the loading  of the full object model of a page until the loading is requested explicitly. If the page has not been altered, it  can be unloaded on request.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMPageReference    *newInterface;
     * // The following value is defined outside of 
     * // this example.
     * XPS_SIZE        advisoryPageDimensions;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePageReference (
     *         &advisoryPageDimensions,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that sets the advisory page dimensions (page width and  page height).
     *           
     * 
     * Size is described in XPS units. There are 96 XPS units per inch. For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @returns {IXpsOMPageReference} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference">IXpsOMPageReference</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagereference
     */
    CreatePageReference(advisoryPageDimensions) {
        result := ComCall(14, this, "ptr", advisoryPageDimensions, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }

    /**
     * Creates an IXpsOMPage interface, which provides the root node of a tree of objects that represent the contents of a single page.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMPage        *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  LPWSTR        language;
     * //  XPS_SIZE      pageDimensions;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreatePage (
     *             &pageDimensions,
     *             language,
     *             partUri,
     *             &newInterface);
     * 
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_SIZE>} pageDimensions The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that specifies the size of the page to be created.
     *           
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @param {PWSTR} language The string that indicates the default language of the created page.
     * 
     * <div class="alert"><b>Important</b>  The language string must follow the RFC 3066 syntax.</div>
     * <div> </div>
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource.
     * @returns {IXpsOMPage} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpage
     */
    CreatePage(pageDimensions, language, partUri) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(15, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * Reads the page markup from the specified stream to create and populate an IXpsOMPage interface.
     * @remarks
     * This method does not validate the contents of any stream-based resources that it loads from the stream  into the document objects. The application must verify these resources before it uses them.
     * @param {IStream} pageMarkupStream The stream that contains the page markup.
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the page's URI.
     * @param {IXpsOMPartResources} resources The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface that contains the resources used by the page.
     * @param {BOOL} reuseObjects A Boolean value that specifies  whether  the software  is to attempt to optimize the page contents tree by sharing objects that are identical in all properties and children. 
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
     * The software will attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The software will not attempt to optimize the object tree.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IXpsOMPage} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagefromstream
     */
    CreatePageFromStream(pageMarkupStream, partUri, resources, reuseObjects) {
        result := ComCall(16, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * Creates an IXpsOMCanvas interface that is used to group page elements.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMCanvas    *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateCanvas (&newInterface);
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @returns {IXpsOMCanvas} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcanvas">IXpsOMCanvas</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcanvas
     */
    CreateCanvas() {
        result := ComCall(17, this, "ptr*", &canvas := 0, "HRESULT")
        return IXpsOMCanvas(canvas)
    }

    /**
     * Creates an IXpsOMGlyphs interface, which specifies text that appears on a page.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMGlyphs       *newInterface;
     * // this interface is defined outside of this example
     * //  IXpsOMFontResource *font; 
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateGlyphs (font, &newInterface);
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IXpsOMFontResource} fontResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface of the font resource to be used.
     * @returns {IXpsOMGlyphs} The new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createglyphs
     */
    CreateGlyphs(fontResource) {
        result := ComCall(18, this, "ptr", fontResource, "ptr*", &glyphs := 0, "HRESULT")
        return IXpsOMGlyphs(glyphs)
    }

    /**
     * Creates an IXpsOMPath interface that specifies a graphical path element on a page.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMPath    *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreatePath (&newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @returns {IXpsOMPath} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpath
     */
    CreatePath() {
        result := ComCall(19, this, "ptr*", &_path := 0, "HRESULT")
        return IXpsOMPath(_path)
    }

    /**
     * Creates an IXpsOMGeometry interface, which specifies the shape of a path or of a clipping region.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMGeometry    *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateGeometry (&newInterface);
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @returns {IXpsOMGeometry} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometry
     */
    CreateGeometry() {
        result := ComCall(20, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }

    /**
     * Creates an IXpsOMGeometryFigure interface, which specifies a portion of an object that is defined by an IXpsOMGeometry interface.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMGeometryFigure    *newInterface;
     * // startPoint contains the starting point
     * // of the geometry figure being created
     * XPS_POINT                startPoint = {0,0};
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateGeometryFigure (&startPoint, &newInterface);
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_POINT>} startPoint The coordinates of the starting point of the geometry figure.
     * @returns {IXpsOMGeometryFigure} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometryfigure
     */
    CreateGeometryFigure(startPoint) {
        result := ComCall(21, this, "ptr", startPoint, "ptr*", &figure := 0, "HRESULT")
        return IXpsOMGeometryFigure(figure)
    }

    /**
     * Creates an IXpsOMMatrixTransform interface that specifies an affine matrix transform.
     * @remarks
     * The transform specified by this matrix can be applied to the transform property of other XPS objects.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMMatrixTransform    *newInterface;
     * // The following value is defined outside of 
     * // this example.
     * XPS_MATRIX        newMatrix;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateMatrixTransform (
     *         &newMatrix,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_MATRIX>} _matrix 
     * @returns {IXpsOMMatrixTransform} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creatematrixtransform
     */
    CreateMatrixTransform(_matrix) {
        result := ComCall(22, this, "ptr", _matrix, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * Creates an IXpsOMSolidColorBrush interface, which specifies a brush of a single, solid color.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMSolidColorBrush             *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  XPS_COLOR                     color;
     * //  IXpsOMColorProfileResource    *colorProfile;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateSolidColorBrush (
     *         &color,
     *         colorProfile,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_COLOR>} _color 
     * @param {IXpsOMColorProfileResource} colorProfile The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface. Unless the color type is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>, this value must be <b>NULL</b>.
     * @returns {IXpsOMSolidColorBrush} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsolidcolorbrush">IXpsOMSolidColorBrush</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsolidcolorbrush
     */
    CreateSolidColorBrush(_color, colorProfile) {
        result := ComCall(23, this, "ptr", _color, "ptr", colorProfile, "ptr*", &solidColorBrush := 0, "HRESULT")
        return IXpsOMSolidColorBrush(solidColorBrush)
    }

    /**
     * Creates an IXpsOMColorProfileResource interface, which is used to access a color profile resource stream.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMColorProfileResource    *newInterface;
     * IOpcPartUri                   *partUri;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     // The partUriString and acquiredStream variables 
     *     //   are defined outside of this example.
     *     hr = xpsFactory->CreatePartUri(
     *         partUriString, 
     *         &partUri);
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreateColorProfileResource (
     *             acquiredStream, 
     *             partUri,
     *             &newInterface);
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IStream} acquiredStream The read-only <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface to be associated with this resource. This parameter must not be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object;   do not re-enter it.</div>
     * <div> </div>
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource.
     * @returns {IXpsOMColorProfileResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcolorprofileresource
     */
    CreateColorProfileResource(acquiredStream, partUri) {
        result := ComCall(24, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &colorProfileResource := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfileResource)
    }

    /**
     * Creates an IXpsOMImageBrush interface.
     * @remarks
     * The brush's viewbox specifies the portion of a source image or visual to be used as the tile image.
     * 
     * The coordinates of the brush's viewbox are relative to the source content, such that  (0,0) specifies the upper-left corner of the source content. For images, dimensions specified by the brush's viewbox are expressed in the units of 1/96". The corresponding pixel coordinates in the source image are calculated as follows: 
     * 
     * In the illustration that follows, the image on the left is an example of a source image, and  that on the far right is the brush that results after selecting the viewbox. 
     * 
     * <img alt="An illustration that shows a viewbox example" src="./images/CreateBrush.png"/>
     * If the source image resolution is 96 by 96 dots per inch and image dimensions are 96 by 96 pixels, the values of fields in the <i>viewbox</i> parameter are as follows:
     * 
     * The preceding parameter values correspond to the  source image as follows:<dl>
     * <dd>SourceLeft = (96 × 48) / 96  = 48 pixels from the left side</dd>
     * <dd>SourceTop = (96 × 24) / 96 = 24 pixels from the top</dd>
     * <dd>SourceWidth = (96 × 24) / 96 = 24 pixels wide</dd>
     * <dd>SourceHeight = (96 × 48) / 96 = 48 pixels high</dd>
     * </dl>
     * 
     * 
     * An image brush is a tile brush that takes an image, or a part of it,  transforms the image to create a tile, places the resulting tile in the viewport  (the destination geometry of the tile in  the output area), and fills the output area  as described by the tile mode.
     * 
     * The <i>viewport</i> is the area covered by the first tile in the output area. The viewport image is repeated throughout the output area as described by the tile mode.
     * 
     * The next  illustration shows how an image brush is used to fill an output area.  From left to right, the original image is transformed to fill the viewport, then placed in the viewport area of the output area, and then tiled to fill the output area.
     * 
     * <img alt="A figure that shows how a tile brush fills a geometry" src="./images/tile_cherry.png"/>
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMImageBrush            *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  IXpsOMImageResource     *image;
     * //  XPS_RECT                viewBox;
     * //  XPS_RECT                viewPort;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateImageBrush (
     *         image,
     *         &viewBox,
     *         &viewPort,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IXpsOMImageResource} _image 
     * @param {Pointer<XPS_RECT>} viewBox The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that defines the <i>viewbox</i>, which is the area  of the source image that is used by the brush.
     * @param {Pointer<XPS_RECT>} viewPort The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that defines the <i>viewport</i>, which is the area covered by the first    tile in the output area.
     * @returns {IXpsOMImageBrush} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimagebrush">IXpsOMImageBrush</a>  interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimagebrush
     */
    CreateImageBrush(_image, viewBox, viewPort) {
        result := ComCall(25, this, "ptr", _image, "ptr", viewBox, "ptr", viewPort, "ptr*", &imageBrush := 0, "HRESULT")
        return IXpsOMImageBrush(imageBrush)
    }

    /**
     * Creates an IXpsOMVisualBrush interface, which is an IXpsOMTileBrush that uses a visual object.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMVisualBrush        *newInterface;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateVisualBrush (
     *         &viewBox,
     *         &viewPort,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // assign visual using one of the following:
     *         newInterface->SetVisualLocal (localVisual);
     *         // or
     *         newInterface->SetVisualLookup (visualLookupKey);
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * // use newInterface
     * 
     * newInterface->Release();
     * xpsFactory->Release();
     * 
     * 
     * ```
     * @param {Pointer<XPS_RECT>} viewBox The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that specifies the source image's  area to be used in the brush. This parameter must not be <b>NULL</b>.
     * @param {Pointer<XPS_RECT>} viewPort The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that specifies the destination geometry area of the tile. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMVisualBrush} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualbrush">IXpsOMVisualBrush</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createvisualbrush
     */
    CreateVisualBrush(viewBox, viewPort) {
        result := ComCall(26, this, "ptr", viewBox, "ptr", viewPort, "ptr*", &visualBrush := 0, "HRESULT")
        return IXpsOMVisualBrush(visualBrush)
    }

    /**
     * Creates an IXpsOMImageResource interface, which is used to access an image resource stream.
     * @remarks
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMImageResource    *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  IStream            *acquiredStream;
     * //  XPS_IMAGE_TYPE     contentType;
     * //  IOpcPartUri        *partUri;
     *     
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     // The partUriString and acquiredStream variables 
     *     //   are defined outside of this example.
     *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreateImageResource (
     *             acquiredStream,
     *             contentType,
     *             partUri,
     *             &newInterface);
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IStream} acquiredStream The read-only stream to be associated with this resource. This parameter must 	not be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object; do not re-enter it.</div>
     * <div> </div>
     * @param {Integer} contentType The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type">XPS_IMAGE_TYPE</a> value that describes the image type of the stream that is referenced by <i>acquiredStream</i>.
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMImageResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimageresource
     */
    CreateImageResource(acquiredStream, contentType, partUri) {
        result := ComCall(27, this, "ptr", acquiredStream, "int", contentType, "ptr", partUri, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Creates an IXpsOMPrintTicketResource interface that enables access to a PrintTicket stream.
     * @param {IStream} acquiredStream The read-only PrintTicket resource stream.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object; do not re-enter it.</div>
     * <div> </div>
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource.
     * @returns {IXpsOMPrintTicketResource} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createprintticketresource
     */
    CreatePrintTicketResource(acquiredStream, partUri) {
        result := ComCall(28, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &printTicketResource := 0, "HRESULT")
        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * Creates an IXpsOMFontResource interface, which provides an IStream interface to the font resource.
     * @remarks
     * The value of <i>isObfSourceStream</i> describes the state of the <i>acquiredStream</i>-referenced stream  at  the time the font resource is created. All subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getstream">GetStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-setcontent">SetContent</a> will operate on unobfuscated versions of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * 
     * An error is returned if <i>isObfSourceStream</i> is set to <b>TRUE</b> and <i>fontEmbedding</i> is set to <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_NORMAL</a>, or if the name referenced by <i>partUri</i> does not conform to the syntax for obfuscated streams.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMFontResource    *newInterface;
     * IOpcPartUri           *partUri;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     // The partUriString and acquiredStream variables 
     *     //   are defined outside of this example.
     *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
     *     if (SUCCEEDED(hr))
     *     {
     *         hr = xpsFactory->CreateFontResource (
     *             acquiredStream, 
     *             XPS_FONT_EMBEDDING_NORMAL,    // normal
     *             partUri, 
     *             FALSE,                        // not obfuscated
     *             &newInterface);
     *         if (SUCCEEDED(hr))
     *         {
     *             // use newInterface
     * 
     *             newInterface->Release();
     *         }
     *         partUri->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IStream} acquiredStream The read-only <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface to be associated with this font resource. This parameter must not be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  Treat this stream as a Single-Threaded Apartment (STA) object; do not re-enter it.</div>
     * <div> </div>
     * <div class="alert"><b>Caution</b>  This stream is not to be obfuscated.</div>
     * <div> </div>
     * @param {Integer} fontEmbedding The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING</a> value that specifies the stream's embedding option.
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned    to this resource. This parameter must not  be <b>NULL</b>.
     * @param {BOOL} isObfSourceStream A Boolean value that indicates whether the stream referenced by <i>acquiredStream</i> is obfuscated.
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
     * The stream referenced by <i>acquiredStream</i> is obfuscated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream referenced by <i>acquiredStream</i> is  not obfuscated.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IXpsOMFontResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createfontresource
     */
    CreateFontResource(acquiredStream, fontEmbedding, partUri, isObfSourceStream) {
        result := ComCall(29, this, "ptr", acquiredStream, "int", fontEmbedding, "ptr", partUri, "int", isObfSourceStream, "ptr*", &fontResource := 0, "HRESULT")
        return IXpsOMFontResource(fontResource)
    }

    /**
     * Creates an IXpsOMGradientStop interface to represent a single color and location definition within a gradient.
     * @remarks
     * Gradient stops are used to define the color at a specific location; the color is interpolated between the gradient stops. The offset, which is specified by <i>offset</i>,  is a relative position between the start  and end points of the gradient. The  offset at the start point of a linear gradient or the origin of a radial  gradient is 0.0.  The offset of the end point of a linear gradient or the  bounding ellipse of a radial gradient is 1.0. Gradient stops can be specified for any offset between those points, including the start and end points. The following illustration shows the gradient path and gradient stops of a linear gradient.
     * 
     * <img alt="A figure that shows the terms used in a linear gradient" src="./images/LinearGradient2.png"/>
     * The following illustration shows the gradient stops of a radial gradient. In this example, the radial gradient region is the area enclosed by the outer ellipse and the <b>XPS_SPREAD_METHOD_REFLECT</b> spread method  is used to fill the space outside of the gradient region.
     * 
     * <img alt="A figure that shows the terms used in a radial gradient" src="./images/RadialGradient2.png"/>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface specifies one and only one stop in a gradient.
     * 
     * The calculations used to render a gradient are described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMGradientStop    *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  XPS_COLOR                    color;
     * //  IXpsOMColorProfileResource    *colorProfile;
     * //  FLOAT                        offset;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateGradientStop (
     *         &color,
     *         colorProfile,
     *         offset,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {Pointer<XPS_COLOR>} _color 
     * @param {IXpsOMColorProfileResource} colorProfile A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface that contains the color profile to be used. If the color type is not <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>, this parameter must be <b>NULL</b>.
     * @param {Float} offset The offset value.
     * 
     * Valid range: 0.0–1.0
     * @returns {IXpsOMGradientStop} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategradientstop
     */
    CreateGradientStop(_color, colorProfile, offset) {
        result := ComCall(30, this, "ptr", _color, "ptr", colorProfile, "float", offset, "ptr*", &gradientStop := 0, "HRESULT")
        return IXpsOMGradientStop(gradientStop)
    }

    /**
     * Creates an IXpsOMLinearGradientBrush interface.
     * @remarks
     * The gradient region of a linear gradient is the area between and including the start and end points and extending in both directions at a right angle to the gradient path. The spread area is the area of the geometry that lies outside the gradient region.
     * 
     * Gradient stops define the color at specific locations along the gradient path. In the illustration, gradient stop 0, specified by the <i>gradStop1</i> parameter,  is located at the start point of the gradient path, and gradient stop 1, specified by the  <i>gradStop2</i> parameter, is at the end point.
     * 
     * As shown in the illustration that follows, the start and end points of a linear gradient are also the start and end points of the gradient path, which is the straight line that connects those points.
     * 
     * <img alt="A figure that shows the terms used in a linear gradient" src="./images/LinearGradient1.png"/>
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMLinearGradientBrush    *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  IXpsOMGradientStop       *gradStop1, *gradStop2;
     * //  XPS_POINT                startPoint, endPoint;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateLinearGradientBrush (
     *         gradStop1,
     *         gradStop2,
     *         &startPoint,
     *         &endPoint,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IXpsOMGradientStop} gradStop1 The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface that specifies the  gradient properties at  the beginning of  the gradient's vector. This parameter must not be <b>NULL</b>.
     * @param {IXpsOMGradientStop} gradStop2 The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface that specifies the  gradient properties at the end of the gradient's vector. This parameter must not be <b>NULL</b>.
     * @param {Pointer<XPS_POINT>} startPoint The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that contains the coordinates of the start point in two-dimensional space.
     * @param {Pointer<XPS_POINT>} endPoint The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that contains the coordinates of the end point in two-dimensional space.
     * @returns {IXpsOMLinearGradientBrush} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomlineargradientbrush">IXpsOMLinearGradientBrush</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createlineargradientbrush
     */
    CreateLinearGradientBrush(gradStop1, gradStop2, startPoint, endPoint) {
        result := ComCall(31, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", startPoint, "ptr", endPoint, "ptr*", &linearGradientBrush := 0, "HRESULT")
        return IXpsOMLinearGradientBrush(linearGradientBrush)
    }

    /**
     * Creates an IXpsOMRadialGradientBrush interface.
     * @remarks
     * As shown in the following illustration, the gradient region of a radial gradient is the area enclosed by the ellipse that is described by the center point and the x and y radii that extend from the center point. The spread area is the area outside of that ellipse. The gradient path (not shown) is a radial line that is drawn between the gradient origin and the ellipse that bounds the gradient region.
     * 
     * <img alt="A figure that shows the terms used in a radial gradient" src="./images/RadialGradient1.png"/>
     * For radial-gradient brushes, the gradient stop that is set by the <i>gradStop1</i> parameter corresponds to the gradient origin location and an offset value of 0.0. The gradient stop that is set by the <i>gradStop2</i> parameter corresponds to the circumference of the gradient region and an offset value of 1.0. For more information on gradient stops, see <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a>.
     * 
     * The code example that follows illustrates how this method is used to create a new  interface.
     * 
     * 
     * ```cpp
     * 
     * IXpsOMRadialGradientBrush    *newInterface;
     * // The following values are defined outside of 
     * // this example.
     * //  IXpsOMGradientStop       *gradStop1, *gradStop2;
     * //  XPS_POINT                centerPoint, gradientOrigin;
     * //  XPS_SIZE                 radiiSizes;
     * 
     * // Note the implicit requirement that CoInitializeEx 
     * //  has previously been called from this thread.
     * 
     * hr = CoCreateInstance(
     *     __uuidof(XpsOMObjectFactory),
     *     NULL,
     *     CLSCTX_INPROC_SERVER,
     *     _uuidof(IXpsOMObjectFactory),
     *     reinterpret_cast<LPVOID*>(&xpsFactory)
     *     );
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = xpsFactory->CreateRadialGradientBrush (
     *         gradStop1,
     *         gradStop2,
     *         &centerPoint,
     *         &gradientOrigin,
     *         &radiiSizes,
     *         &newInterface);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // use newInterface
     * 
     *         newInterface->Release();
     *     }
     *     xpsFactory->Release();
     * }
     * else
     * {
     *     // evaluate HRESULT error returned in hr
     * }
     * 
     * ```
     * @param {IXpsOMGradientStop} gradStop1 The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface that specifies the  properties of the gradient  at gradient origin. This parameter must not be <b>NULL</b>.
     * @param {IXpsOMGradientStop} gradStop2 The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interface that specifies the  properties of the gradient  at the end of  the gradient's vector, which is the ellipse that encloses the gradient region. This parameter must not be <b>NULL</b>.
     * @param {Pointer<XPS_POINT>} centerPoint The coordinates of the center point of the radial gradient ellipse.
     * @param {Pointer<XPS_POINT>} gradientOrigin The coordinates of the origin  of the radial gradient.
     * @param {Pointer<XPS_SIZE>} radiiSizes The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure whose members specify the lengths of the gradient region's radii.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch. For example, a 1" radius is 96 XPS units.
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * <b>width</b>
     * 
     * </td>
     * <td>
     * Length of the radius  along the x-axis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>height</b>
     * 
     * </td>
     * <td>
     * Length of the radius  along the y-axis.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IXpsOMRadialGradientBrush} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomradialgradientbrush">IXpsOMRadialGradientBrush</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createradialgradientbrush
     */
    CreateRadialGradientBrush(gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes) {
        result := ComCall(32, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", centerPoint, "ptr", gradientOrigin, "ptr", radiiSizes, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return IXpsOMRadialGradientBrush(radialGradientBrush)
    }

    /**
     * Creates an IXpsOMCoreProperties interface, which contains the metadata that describes an XPS document.
     * @param {IOpcPartUri} partUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name to be assigned to this resource. This parameter must not be <b>NULL</b>.
     * @returns {IXpsOMCoreProperties} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcoreproperties
     */
    CreateCoreProperties(partUri) {
        result := ComCall(33, this, "ptr", partUri, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }

    /**
     * Creates an IXpsOMDictionary interface, which enables the sharing of property resources.
     * @returns {IXpsOMDictionary} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdictionary
     */
    CreateDictionary() {
        result := ComCall(34, this, "ptr*", &dictionary := 0, "HRESULT")
        return IXpsOMDictionary(dictionary)
    }

    /**
     * Creates an IXpsOMPartUriCollection interface that can contain IOpcPartUri interface pointers.
     * @returns {IXpsOMPartUriCollection} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomparturicollection">IXpsOMPartUriCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturicollection
     */
    CreatePartUriCollection() {
        result := ComCall(35, this, "ptr*", &partUriCollection := 0, "HRESULT")
        return IXpsOMPartUriCollection(partUriCollection)
    }

    /**
     * Opens a file for writing the contents of an XPS OM to an XPS package.
     * @remarks
     * The file is opened and initialized and the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface that is returned is then used to write content types, package relationships, core properties, document sequence resources, and document sequence relationships.
     * 
     *   
     * 
     * If <i>documentSequencePrintTicket</i> is set to  <b>NULL</b> and the value of <i>interleaving</i> is <b>XPS_INTERLEAVING_ON</b>,  this method creates a blank job-level print ticket and adds a relationship to the blank print ticket. This is done to provide more efficient streaming consumption of the package.
     * 
     * If <i>documentSequencePrintTicket</i> is set to <b>NULL</b> and the value of <i>interleaving</i> is <b>XPS_INTERLEAVING_OFF</b>,  no blank print ticket is created.
     * @param {PWSTR} fileName The name of the file to be created.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure, which contains two separate but related  members:
     * 
     * <ul>
     * <li><b>lpSecurityDescriptor</b>: an optional security descriptor</li>
     * <li><b>bInheritHandle</b>:  a Boolean value that determines whether the returned handle can be inherited by child processes</li>
     * </ul>
     * If  <b>lpSecurityDescriptor</b> is <b>NULL</b>, the file or device associated with the returned handle is assigned a default security descriptor.
     * 
     *  For more information about <i>securityAttributes</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @param {Integer} flagsAndAttributes Specifies the settings and attributes of the file to be created. For most files, the <b>FILE_ATTRIBUTE_NORMAL</b> value can be used.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> for more information about this parameter.
     * @param {BOOL} optimizeMarkupSize A Boolean value that  indicates whether the document markup will be optimized for size when the contents of the XPS OM are written to the XPS package.
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
     * @param {Integer} interleaving Specifies whether the content of the XPS OM will be interleaved when it is written to the file.
     * @param {IOpcPartUri} documentSequencePartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part. This parameter can be set to <b>NULL</b>.
     * @returns {IXpsOMPackageWriter} A pointer to the new  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronfile
     */
    CreatePackageWriterOnFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(36, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Opens a stream for writing the contents of an XPS OM to an XPS package.
     * @remarks
     * The stream is opened and initialized, and then the returned <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface  is used to write content types, package relationships, core properties, document sequence resources, and document sequence relationships.
     * 
     * If <i>documentSequencePrintTicket</i> is set to <b>NULL</b> and the value of <i>interleaving</i> is <b>XPS_INTERLEAVING_ON</b>,  this method creates a blank job-level print ticket and adds a relationship to the blank print ticket. This is done to provide more efficient streaming consumption of the package.
     * 
     * If <i>documentSequencePrintTicket</i> is set to  <b>NULL</b> and the value of <i>interleaving</i> is <b>XPS_INTERLEAVING_OFF</b>,  no blank print ticket is created.
     * @param {ISequentialStream} outputStream The stream to be used for writing.
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
     * @param {Integer} interleaving Specifies whether the content of the XPS OM will be interleaved when it is written to the stream.
     * @param {IOpcPartUri} documentSequencePartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name of the document sequence in the new file.
     * @param {IXpsOMCoreProperties} coreProperties The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface that contains the core document properties to be given to the new file. This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMImageResource} packageThumbnail The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface that contains the package-level print ticket to be assigned to the new file.  This parameter can be set to <b>NULL</b>.
     * @param {IOpcPartUri} discardControlPartName The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part.  This parameter can be set to <b>NULL</b>.
     * @returns {IXpsOMPackageWriter} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronstream
     */
    CreatePackageWriterOnStream(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName) {
        result := ComCall(37, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * Creates an IOpcPartUri interface that uses the specified URI.
     * @param {PWSTR} uri The URI string.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturi
     */
    CreatePartUri(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(38, this, "ptr", uri, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * Creates a read-only IStream over the specified file.
     * @remarks
     * <b>CreateReadOnlyStreamOnFile</b> is a wrapper method for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createstreamonfile">IOpcFactory::CreateStreamOnFile</a>. It has the same effect as calling the following:
     * 
     * 
     * ```cpp
     *     hr = opcFactory->CreateStreamOnFile (
     *         fileName,
     *         OPC_STREAM_IO_READ,
     *         NULL,
     *         FILE_ATTRIBUTE_NORMAL,
     *         &stream);
     * 
     * ```
     * @param {PWSTR} filename The name of the file to be opened.
     * @returns {IStream} A stream over the specified file.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createreadonlystreamonfile
     */
    CreateReadOnlyStreamOnFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(39, this, "ptr", filename, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }
}
