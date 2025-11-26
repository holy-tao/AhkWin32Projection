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
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &document := 0, "HRESULT")
        return IXpsOMDocument(document)
    }

    /**
     * Gets a pointer to the IXpsOMPage interface that contains the page.
     * @returns {IXpsOMPage} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface of the page. If a page has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage
     */
    GetPage() {
        result := ComCall(4, this, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * Sets the IXpsOMPage interface of the page reference.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setpage
     */
    SetPage(page) {
        result := ComCall(5, this, "ptr", page, "HRESULT")
        return result
    }

    /**
     * Discards the page from memory.
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
     * <a href="/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-discardpage">DiscardPage</a> has been called more than once or the page has not been loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-discardpage
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-ispageloaded
     */
    IsPageLoaded() {
        result := ComCall(7, this, "int*", &isPageLoaded := 0, "HRESULT")
        return isPageLoaded
    }

    /**
     * Gets the suggested dimensions of the page.
     * @returns {XPS_SIZE} The suggested dimensions of the page.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getadvisorypagedimensions
     */
    GetAdvisoryPageDimensions() {
        pageDimensions := XPS_SIZE()
        result := ComCall(8, this, "ptr", pageDimensions, "HRESULT")
        return pageDimensions
    }

    /**
     * Sets the suggested dimensions of the page.
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
     * Either <i>pageDimensions</i> is <b>NULL</b> or a field in the <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that is referenced by <i>pageDimensions</i> contains a value that is not valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setadvisorypagedimensions
     */
    SetAdvisoryPageDimensions(pageDimensions) {
        result := ComCall(9, this, "ptr", pageDimensions, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMStoryFragmentsResource interface of the StoryFragments part resource that is associated with the page.
     * @returns {IXpsOMStoryFragmentsResource} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomstoryfragmentsresource">IXpsOMStoryFragmentsResource</a> interface of the StoryFragments part resource that is associated with the page.  If there is no StoryFragments part, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getstoryfragmentsresource
     */
    GetStoryFragmentsResource() {
        result := ComCall(10, this, "ptr*", &storyFragmentsResource := 0, "HRESULT")
        return IXpsOMStoryFragmentsResource(storyFragmentsResource)
    }

    /**
     * Sets the IXpsOMStoryFragmentsResource interface pointer of the StoryFragments resource to be assigned to the page.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setstoryfragmentsresource
     */
    SetStoryFragmentsResource(storyFragmentsResource) {
        result := ComCall(11, this, "ptr", storyFragmentsResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMPrintTicketResource interface of the page-level print ticket resource that is associated with the page.
     * @returns {IXpsOMPrintTicketResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomprintticketresource">IXpsOMPrintTicketResource</a> interface of the page-level print ticket resource that is associated with the page. If no print ticket resource has been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getprintticketresource
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(13, this, "ptr", printTicketResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMImageResource interface of the thumbnail image resource that is associated with the page.
     * @returns {IXpsOMImageResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface of the  thumbnail image resource that is associated with the page.  If no thumbnail image resource has been assigned to the page, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getthumbnailresource
     */
    GetThumbnailResource() {
        result := ComCall(14, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Sets the pointer to the IXpsOMImageResource interface of the thumbnail image resource to be assigned to the page.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setthumbnailresource
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(15, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Gets an IXpsOMNameCollection interface that contains the names of all the document subtree objects whose IsHyperlinkTarget property is set to TRUE.
     * @returns {IXpsOMNameCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomnamecollection">IXpsOMNameCollection</a> interface that contains the names of all the document subtree objects whose <b>IsHyperlinkTarget</b> property is set to <b>TRUE</b>. If no such objects exist in the document, the <b>IXpsOMNameCollection</b> interface will be empty.
     * 
     * <div class="alert"><b>Note</b>  Every time this method is called, it returns a new collection.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectlinktargets
     */
    CollectLinkTargets() {
        result := ComCall(16, this, "ptr*", &linkTargets := 0, "HRESULT")
        return IXpsOMNameCollection(linkTargets)
    }

    /**
     * Creates a list of all part-based resources that are associated with the page.
     * @returns {IXpsOMPartResources} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources">IXpsOMPartResources</a> interface that contains the list of all part-based resources that are associated with the page.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectpartresources
     */
    CollectPartResources() {
        result := ComCall(17, this, "ptr*", &partResources := 0, "HRESULT")
        return IXpsOMPartResources(partResources)
    }

    /**
     * Gets a Boolean value that indicates whether the document sub-tree of the referenced page includes any Glyphs that have a font resource whose EmbeddingOption property is set to XPS_FONT_EMBEDDING_RESTRICTED.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-hasrestrictedfonts
     */
    HasRestrictedFonts() {
        result := ComCall(18, this, "int*", &restrictedFonts := 0, "HRESULT")
        return restrictedFonts
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMPageReference} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-clone
     */
    Clone() {
        result := ComCall(19, this, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }
}
