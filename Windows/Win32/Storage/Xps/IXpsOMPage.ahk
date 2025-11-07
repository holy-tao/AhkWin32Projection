#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPageReference.ahk
#Include .\IXpsOMVisualCollection.ahk
#Include .\XPS_SIZE.ahk
#Include .\XPS_RECT.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMPage.ahk
#Include .\IXpsOMPart.ahk

/**
 * Provides the root node of a tree of objects that hold the contents of a single page.
 * @remarks
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
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
 * 
 * 
 * For information about using this interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372917(v=vs.85)">Navigate the XPS OM</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompage
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPage extends IXpsOMPart{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPage
     * @type {Guid}
     */
    static IID => Guid("{d3e18888-f120-4fee-8c68-35296eae91d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetVisuals", "GetPageDimensions", "SetPageDimensions", "GetContentBox", "SetContentBox", "GetBleedBox", "SetBleedBox", "GetLanguage", "SetLanguage", "GetName", "SetName", "GetIsHyperlinkTarget", "SetIsHyperlinkTarget", "GetDictionary", "GetDictionaryLocal", "SetDictionaryLocal", "GetDictionaryResource", "SetDictionaryResource", "Write", "GenerateUnusedLookupKey", "Clone"]

    /**
     * 
     * @returns {IXpsOMPageReference} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }

    /**
     * 
     * @returns {IXpsOMVisualCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getvisuals
     */
    GetVisuals() {
        result := ComCall(6, this, "ptr*", &visuals := 0, "HRESULT")
        return IXpsOMVisualCollection(visuals)
    }

    /**
     * 
     * @returns {XPS_SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getpagedimensions
     */
    GetPageDimensions() {
        pageDimensions := XPS_SIZE()
        result := ComCall(7, this, "ptr", pageDimensions, "HRESULT")
        return pageDimensions
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setpagedimensions
     */
    SetPageDimensions(pageDimensions) {
        result := ComCall(8, this, "ptr", pageDimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getcontentbox
     */
    GetContentBox() {
        contentBox := XPS_RECT()
        result := ComCall(9, this, "ptr", contentBox, "HRESULT")
        return contentBox
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} contentBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setcontentbox
     */
    SetContentBox(contentBox) {
        result := ComCall(10, this, "ptr", contentBox, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getbleedbox
     */
    GetBleedBox() {
        bleedBox := XPS_RECT()
        result := ComCall(11, this, "ptr", bleedBox, "HRESULT")
        return bleedBox
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} bleedBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setbleedbox
     */
    SetBleedBox(bleedBox) {
        result := ComCall(12, this, "ptr", bleedBox, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getlanguage
     */
    GetLanguage() {
        result := ComCall(13, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(14, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getname
     */
    GetName() {
        result := ComCall(15, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(16, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getishyperlinktarget
     */
    GetIsHyperlinkTarget() {
        result := ComCall(17, this, "int*", &isHyperlinkTarget := 0, "HRESULT")
        return isHyperlinkTarget
    }

    /**
     * 
     * @param {BOOL} isHyperlinkTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setishyperlinktarget
     */
    SetIsHyperlinkTarget(isHyperlinkTarget) {
        result := ComCall(18, this, "int", isHyperlinkTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMDictionary} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionary
     */
    GetDictionary() {
        result := ComCall(19, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * 
     * @returns {IXpsOMDictionary} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal
     */
    GetDictionaryLocal() {
        result := ComCall(20, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * 
     * @param {IXpsOMDictionary} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal
     */
    SetDictionaryLocal(resourceDictionary) {
        result := ComCall(21, this, "ptr", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMRemoteDictionaryResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource
     */
    GetDictionaryResource() {
        result := ComCall(22, this, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }

    /**
     * 
     * @param {IXpsOMRemoteDictionaryResource} remoteDictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource
     */
    SetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(23, this, "ptr", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISequentialStream} stream 
     * @param {BOOL} optimizeMarkupSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-write
     */
    Write(stream, optimizeMarkupSize) {
        result := ComCall(24, this, "ptr", stream, "int", optimizeMarkupSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-generateunusedlookupkey
     */
    GenerateUnusedLookupKey(type) {
        result := ComCall(25, this, "int", type, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * 
     * @returns {IXpsOMPage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-clone
     */
    Clone() {
        result := ComCall(26, this, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }
}
