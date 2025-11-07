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
     * 
     * @returns {IXpsOMDocument} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &document := 0, "HRESULT")
        return IXpsOMDocument(document)
    }

    /**
     * 
     * @returns {IXpsOMPage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getpage
     */
    GetPage() {
        result := ComCall(4, this, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * 
     * @param {IXpsOMPage} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setpage
     */
    SetPage(page) {
        result := ComCall(5, this, "ptr", page, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-discardpage
     */
    DiscardPage() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-ispageloaded
     */
    IsPageLoaded() {
        result := ComCall(7, this, "int*", &isPageLoaded := 0, "HRESULT")
        return isPageLoaded
    }

    /**
     * 
     * @returns {XPS_SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getadvisorypagedimensions
     */
    GetAdvisoryPageDimensions() {
        pageDimensions := XPS_SIZE()
        result := ComCall(8, this, "ptr", pageDimensions, "HRESULT")
        return pageDimensions
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setadvisorypagedimensions
     */
    SetAdvisoryPageDimensions(pageDimensions) {
        result := ComCall(9, this, "ptr", pageDimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMStoryFragmentsResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getstoryfragmentsresource
     */
    GetStoryFragmentsResource() {
        result := ComCall(10, this, "ptr*", &storyFragmentsResource := 0, "HRESULT")
        return IXpsOMStoryFragmentsResource(storyFragmentsResource)
    }

    /**
     * 
     * @param {IXpsOMStoryFragmentsResource} storyFragmentsResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setstoryfragmentsresource
     */
    SetStoryFragmentsResource(storyFragmentsResource) {
        result := ComCall(11, this, "ptr", storyFragmentsResource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMPrintTicketResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getprintticketresource
     */
    GetPrintTicketResource() {
        result := ComCall(12, this, "ptr*", &printTicketResource := 0, "HRESULT")
        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * 
     * @param {IXpsOMPrintTicketResource} printTicketResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setprintticketresource
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(13, this, "ptr", printTicketResource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMImageResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-getthumbnailresource
     */
    GetThumbnailResource() {
        result := ComCall(14, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * 
     * @param {IXpsOMImageResource} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-setthumbnailresource
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(15, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMNameCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectlinktargets
     */
    CollectLinkTargets() {
        result := ComCall(16, this, "ptr*", &linkTargets := 0, "HRESULT")
        return IXpsOMNameCollection(linkTargets)
    }

    /**
     * 
     * @returns {IXpsOMPartResources} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectpartresources
     */
    CollectPartResources() {
        result := ComCall(17, this, "ptr*", &partResources := 0, "HRESULT")
        return IXpsOMPartResources(partResources)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-hasrestrictedfonts
     */
    HasRestrictedFonts() {
        result := ComCall(18, this, "int*", &restrictedFonts := 0, "HRESULT")
        return restrictedFonts
    }

    /**
     * 
     * @returns {IXpsOMPageReference} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-clone
     */
    Clone() {
        result := ComCall(19, this, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }
}
