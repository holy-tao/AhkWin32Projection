#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    GetOwner(document) {
        result := ComCall(3, this, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     */
    GetPage(page) {
        result := ComCall(4, this, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     */
    SetPage(page) {
        result := ComCall(5, this, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiscardPage() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isPageLoaded 
     * @returns {HRESULT} 
     */
    IsPageLoaded(isPageLoaded) {
        result := ComCall(7, this, "ptr", isPageLoaded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     */
    GetAdvisoryPageDimensions(pageDimensions) {
        result := ComCall(8, this, "ptr", pageDimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     */
    SetAdvisoryPageDimensions(pageDimensions) {
        result := ComCall(9, this, "ptr", pageDimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMStoryFragmentsResource>} storyFragmentsResource 
     * @returns {HRESULT} 
     */
    GetStoryFragmentsResource(storyFragmentsResource) {
        result := ComCall(10, this, "ptr", storyFragmentsResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMStoryFragmentsResource>} storyFragmentsResource 
     * @returns {HRESULT} 
     */
    SetStoryFragmentsResource(storyFragmentsResource) {
        result := ComCall(11, this, "ptr", storyFragmentsResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPrintTicketResource>} printTicketResource 
     * @returns {HRESULT} 
     */
    GetPrintTicketResource(printTicketResource) {
        result := ComCall(12, this, "ptr", printTicketResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPrintTicketResource>} printTicketResource 
     * @returns {HRESULT} 
     */
    SetPrintTicketResource(printTicketResource) {
        result := ComCall(13, this, "ptr", printTicketResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     */
    GetThumbnailResource(imageResource) {
        result := ComCall(14, this, "ptr", imageResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(15, this, "ptr", imageResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMNameCollection>} linkTargets 
     * @returns {HRESULT} 
     */
    CollectLinkTargets(linkTargets) {
        result := ComCall(16, this, "ptr", linkTargets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPartResources>} partResources 
     * @returns {HRESULT} 
     */
    CollectPartResources(partResources) {
        result := ComCall(17, this, "ptr", partResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} restrictedFonts 
     * @returns {HRESULT} 
     */
    HasRestrictedFonts(restrictedFonts) {
        result := ComCall(18, this, "ptr", restrictedFonts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     */
    Clone(pageReference) {
        result := ComCall(19, this, "ptr", pageReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
