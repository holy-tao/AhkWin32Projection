#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDocument.ahk
#Include .\IXpsOMPage.ahk
#Include .\XPS_SIZE.ahk
#Include .\IXpsOMStoryFragmentsResource.ahk
#Include .\IXpsOMPrintTicketResource.ahk
#Include .\IXpsOMImageResource.ahk
#Include .\IXpsOMNameCollection.ahk
#Include .\IXpsOMPartResources.ahk
#Include .\IXpsOMPageReference.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables virtualization of pages in an XPS document.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
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
 * 
 * 
 * For information about using this interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372917(v=vs.85)">Navigate the XPS OM</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPageReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPageReference
     * @type {Guid}
     */
    static IID => Guid("{ed360180-6f92-4998-890d-2f208531a0a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetPage", "SetPage", "DiscardPage", "IsPageLoaded", "GetAdvisoryPageDimensions", "SetAdvisoryPageDimensions", "GetStoryFragmentsResource", "SetStoryFragmentsResource", "GetPrintTicketResource", "SetPrintTicketResource", "GetThumbnailResource", "SetThumbnailResource", "CollectLinkTargets", "CollectPartResources", "HasRestrictedFonts", "Clone"]

    /**
     * Gets a pointer to the IXpsOMDocument interface that contains the page reference.
     * @returns {IXpsOMDocument} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocument">IXpsOMDocument</a> interface that contains the page reference. If the page reference does not have an owner, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &document := 0, "HRESULT")
        return IXpsOMDocument(document)
    }

    /**
     * Gets a pointer to the IXpsOMPage interface that contains the page.
     * @remarks
     * If a page has not been set but the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the page's reference has loaded from an XPS package, this method will load and return the page. If a page has not been set and the <b>IXpsOMPackage</b> interface that contains this page reference has not loaded from an XPS package, a <b>NULL</b> pointer will be returned.
     * 
     * Depending on the page's contents, this call might take some time to return and it might also  cause unexpected changes in  other objects in the document tree. For example, if the page has remote resource dictionary references, the remote resource dictionary might get modified.
     * @returns {IXpsOMPage} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface of the page. If a page has not been set, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage
     */
    GetPage() {
        result := ComCall(4, this, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * Sets the IXpsOMPage interface of the page reference.
     * @remarks
     * The page added by this method can be empty or fully constructed.
     * 
     *  If the incoming page has references to remote dictionary objects, those objects will not be imported into the document object by this call. They must be added in a separate call to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">IXpsOMPage::SetDictionaryResource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">IXpsOMCanvas::SetDictionaryResource</a> method.
     * 
     * If a page has been set, the calling method must first release that  page before calling  <b>SetPage</b> with a new page. To explain, once <b>SetPage</b> has been called with a new page, the original page cannot be discarded even if it still exists in the package.
     * @param {IXpsOMPage} page The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface pointer of the page.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>page</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>page</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setpage
     */
    SetPage(page) {
        result := ComCall(5, this, "ptr", page, "HRESULT")
        return result
    }

    /**
     * Discards the page from memory.
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setpage">SetPage</a> has not been called, calling <b>DiscardPage</b> and then <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">GetPage</a> will return the virtualized page from the source package. If <b>SetPage</b> has been called, calling <b>DiscardPage</b> and then  <b>GetPage</b> will return <b>NULL</b>.
     *         
     * 
     * If the page referenced by this <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference">IXpsOMPageReference</a> interface has been constructed entirely in memory and does not have a corresponding file, <b>DiscardPage</b> will delete the page from memory and the page's content will be lost. If the page has been constructed from a file, <b>DiscardPage</b> will delete the page from memory but will not alter the original file. The page can be reconstructed and read back into memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">GetPage</a>.
     * 
     * If the page has been constructed from a file and subsequently modified, <b>DiscardPage</b> will discard the page from memory, and any changes made to the page will be lost. Calling <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage">GetPage</a> after this will re-read the original content from the file.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-discardpage">DiscardPage</a> has been called more than once or the page has not been loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-discardpage
     */
    DiscardPage() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Gets the referenced page status, which indicates whether the page is loaded.
     * @returns {BOOL} A Boolean value that indicates the status of the page.
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
     * The page is loaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page is not loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-ispageloaded
     */
    IsPageLoaded() {
        result := ComCall(7, this, "int*", &isPageLoaded := 0, "HRESULT")
        return isPageLoaded
    }

    /**
     * Gets the suggested dimensions of the page.
     * @remarks
     * <div class="alert"><b>Note</b>   If a dimension value has not been set, a value of –1.0 is returned for that dimension.</div>
     * <div> </div>
     * @returns {XPS_SIZE} The suggested dimensions of the page.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getadvisorypagedimensions
     */
    GetAdvisoryPageDimensions() {
        pageDimensions := XPS_SIZE()
        result := ComCall(8, this, "ptr", pageDimensions, "HRESULT")
        return pageDimensions
    }

    /**
     * Sets the suggested dimensions of the page.
     * @remarks
     * The <b>height</b> and <b>width</b>  members of the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that is referenced by <i>pageDimensions</i> must have values that are greater than or equal to +1.0, if those fields' values are to be set, or –1.0 if not. For example, if an advisory  dimension were to be set just for the page width,  <i>pageDimensions.width</i> would have the desired value and <i>pageDimensions.height</i> would have the value of –1.0.
     * @param {Pointer<XPS_SIZE>} pageDimensions The suggested dimensions to be set for the page.
     * 
     * The <b>height</b> and <b>width</b> members  must have the value of –1.0 or a value that is greater than or equal to +1.0.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>pageDimensions</i> is <b>NULL</b> or a field in the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that is referenced by <i>pageDimensions</i> contains a value that is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_PAGE_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advisory page size described in <i>pageDimensions</i> was not valid. The <b>height</b> and <b>width</b> members of <i>pageDimensions</i>  must have the value of –1.0 or a value that is greater than or equal to +1.0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setadvisorypagedimensions
     */
    SetAdvisoryPageDimensions(pageDimensions) {
        result := ComCall(9, this, "ptr", pageDimensions, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMStoryFragmentsResource interface of the StoryFragments part resource that is associated with the page.
     * @remarks
     * After the resource is parsed and  loaded into the XPS OM, this method might return an error that applies to another resource. This occurs because when a resource is loaded, all of the relationships are parsed.
     * 
     * The StoryFragments part of a page contains the XML markup that describes the portions of one or more stories  that are associated with a single fixed page. Some of the document contents that might be described by the XML markup in a StoryFragments part include  the story's tables and paragraphs that are found on the page.
     * 
     * The XML markup in  the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * @returns {IXpsOMStoryFragmentsResource} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource">IXpsOMStoryFragmentsResource</a> interface of the StoryFragments part resource that is associated with the page.  If there is no StoryFragments part, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getstoryfragmentsresource
     */
    GetStoryFragmentsResource() {
        result := ComCall(10, this, "ptr*", &storyFragmentsResource := 0, "HRESULT")
        return IXpsOMStoryFragmentsResource(storyFragmentsResource)
    }

    /**
     * Sets the IXpsOMStoryFragmentsResource interface pointer of the StoryFragments resource to be assigned to the page.
     * @remarks
     * The StoryFragments part of a page contains the XML markup that describes  the portions of one or more stories  that are associated with a single fixed page. Some of the document contents that might be described by the XML markup in a StoryFragments part include  the story's tables and paragraphs that are found on the page.
     * 
     * The XML markup  of the DocumentStructure and StoryFragments parts is described in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
     * @param {IXpsOMStoryFragmentsResource} storyFragmentsResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource">IXpsOMStoryFragmentsResource</a> interface of the StoryFragments part resource to be assigned to the page. If an <b>IXpsOMStoryFragmentsResource</b> interface has been set, a <b>NULL</b> pointer will release it.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>storyFragmentsResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setstoryfragmentsresource
     */
    SetStoryFragmentsResource(storyFragmentsResource) {
        result := ComCall(11, this, "ptr", storyFragmentsResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMPrintTicketResource interface of the page-level print ticket resource that is associated with the page.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMPrintTicketResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the page-level print ticket resource that is associated with the page. If no print ticket resource has been set, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getprintticketresource
     */
    GetPrintTicketResource() {
        result := ComCall(12, this, "ptr*", &printTicketResource := 0, "HRESULT")
        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * Sets the IXpsOMPrintTicketResource interface pointer of the page-level print ticket resource that is to be assigned to the page.
     * @param {IXpsOMPrintTicketResource} printTicketResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the page-level print ticket resource that is to be assigned to the page. If a print ticket has already been set, a <b>NULL</b> pointer releases it.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>printTicketResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(13, this, "ptr", printTicketResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMImageResource interface of the thumbnail image resource that is associated with the page.
     * @remarks
     * The thumbnail image is a small, visual representation of the page's  contents.
     * 
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMImageResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface of the  thumbnail image resource that is associated with the page.  If no thumbnail image resource has been assigned to the page, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getthumbnailresource
     */
    GetThumbnailResource() {
        result := ComCall(14, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Sets the pointer to the IXpsOMImageResource interface of the thumbnail image resource to be assigned to the page.
     * @remarks
     * The thumbnail image is a small, visual representation of the document's   contents.
     * 
     * The image type of the image resource must be either  <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type">XPS_IMAGE_TYPE_JPEG</a> or <b>XPS_IMAGE_TYPE_PNG</b>.
     * @param {IXpsOMImageResource} imageResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface  of the thumbnail image resource to be assigned to the page. If an <b>IXpsOMImageResource</b> interface has been set, a <b>NULL</b> pointer will release it.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image in  <i>imageResource</i> is not a supported image type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>imageResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setthumbnailresource
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(15, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Gets an IXpsOMNameCollection interface that contains the names of all the document subtree objects whose IsHyperlinkTarget property is set to TRUE.
     * @remarks
     * If the page is originally loaded from a package but  is not currently loaded in the object model, this method returns the values specified in the original <b>PageContent.LinkTargets</b> markup.
     *       
     * 
     * If the document does not have any link targets, the name collection returned in <i>linkTargets</i> will be empty.
     * 
     * To get the number of elements in the collection that is returned in <i>linkTargets</i>, call the collection's <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomnamecollection-getcount">GetCount</a> method.
     * 
     * This method returns the pointer to a new collection every time it is called. To prevent a memory leak, the pointer to a previous collection should be released when it is no longer needed or before the pointer variable is reused for another call to this method. The following code example shows how this can be done in a program.
     * 
     * 
     * ```cpp
     *     HRESULT                         hr = S_OK;
     *     IXpsOMPage                      *page = NULL;
     *     IXpsOMNameCollection            *linkTargets = NULL;
     * 
     *     UINT32 numTargets = 0;
     *     UINT32 thisTarget = 0;
     *     LPWSTR thisTargetName = NULL;
     * 
     *     // pageRef contains the current page reference 
     * 
     *     // if the page hasn't been loaded yet, for example, if the XPS OM 
     *     //  was loaded from an XPS document, CollectLinkTargets obtains the
     *     //  list of link targets from the <PageContent.LinkTargets> markup
     *     hr = pageRef->CollectLinkTargets(&linkTargets);
     * 
     *     // get the page content of this page reference
     *     hr = pageRef->GetPage (&page);
     * 
     *     // after the page object has been loaded and calling GetPage or 
     *     //  by creating a page in the XPS OM, CollectLinkTargets will now check
     *     //  each of the page elements to return the list so this call to
     *     //  CollectLinkTargets might take longer to return than the previous
     *     //  call above if the XPS OM was created from a file
     *     linkTargets->Release(); // release previous collection
     *     hr = pageRef->CollectLinkTargets(&linkTargets);
     *     
     *     // walk the list of link targets returned
     *     hr = linkTargets->GetCount( &numTargets );
     *     thisTarget = 0;
     *     while (thisTarget < numTargets) {
     *         hr = linkTargets->GetAt (thisTarget, &thisTargetName);
     *         printf ("%s\n", thisTargetName);
     *         // release the target string returned to prevent memory leaks
     *         CoTaskMemFree (thisTargetName);
     *         // get next target in list
     *         thisTarget++;
     *     }
     *     // release page and the link target collection
     *     page->Release();
     *     linkTargets->Release();
     * 
     * ```
     * @returns {IXpsOMNameCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomnamecollection">IXpsOMNameCollection</a> interface that contains the names of all the document subtree objects whose <b>IsHyperlinkTarget</b> property is set to <b>TRUE</b>. If no such objects exist in the document, the <b>IXpsOMNameCollection</b> interface will be empty.
     * 
     * <div class="alert"><b>Note</b>  Every time this method is called, it returns a new collection.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectlinktargets
     */
    CollectLinkTargets() {
        result := ComCall(16, this, "ptr*", &linkTargets := 0, "HRESULT")
        return IXpsOMNameCollection(linkTargets)
    }

    /**
     * Creates a list of all part-based resources that are associated with the page.
     * @remarks
     * If the page is not loaded when this method is called, this method finds the part-based resources that are associated with this page by parsing the relationships part of the page and returns them in the <i>partResources</i> parameter. If the page is loaded, this method traverses the page's object model to find the part-based resources and returns them in <i>partResources</i>.
     * 
     * The list of resource parts that are returned in the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface is a snapshot of the document structure that is taken when the method is called. Changes made to the document after this call are not reflected in the <b>IXpsOMPartResources</b> interface after it is returned by this method. Likewise, changes made to the <b>IXpsOMPartResources</b> interface that is returned by this method will not be reflected in the document contents.
     * @returns {IXpsOMPartResources} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface that contains the list of all part-based resources that are associated with the page.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectpartresources
     */
    CollectPartResources() {
        result := ComCall(17, this, "ptr*", &partResources := 0, "HRESULT")
        return IXpsOMPartResources(partResources)
    }

    /**
     * Gets a Boolean value that indicates whether the document sub-tree of the referenced page includes any Glyphs that have a font resource whose EmbeddingOption property is set to XPS_FONT_EMBEDDING_RESTRICTED.
     * @remarks
     * This value is not updated automatically. If fonts or glyphs are added or removed such that the value changes, <b>HasRestrictedFonts</b> must be called again to get the current value.
     * @returns {BOOL} A Boolean value that indicates whether the document sub-tree of the referenced page includes any <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interfaces that have a font resource whose  <b>EmbeddingOption</b> property is set to <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_RESTRICTED</a>.
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
     * If the referenced page is loaded,  the page references at least one font resource whose <b>EmbeddingOption</b> property is set to <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_RESTRICTED</a>.
     * 
     * If the referenced page is not loaded, it has a relationship with at least one font resource whose <b>EmbeddingOption</b> property is set to   <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_RESTRICTED</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the referenced page is loaded,  the page does not reference any font resources whose <b>EmbeddingOption</b> property is set to <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_RESTRICTED</a>.
     * 
     * If the referenced page is not loaded, it does not have a relationship with a font resource whose <b>EmbeddingOption</b> property is set to   <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING_RESTRICTED</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-hasrestrictedfonts
     */
    HasRestrictedFonts() {
        result := ComCall(18, this, "int*", &restrictedFonts := 0, "HRESULT")
        return restrictedFonts
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMPageReference.Clone)
     * @remarks
     * This method does not update the resource pointers in the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference">IXpsOMPageReference</a>  interface.
     * @returns {IXpsOMPageReference} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-clone
     */
    Clone() {
        result := ComCall(19, this, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }
}
