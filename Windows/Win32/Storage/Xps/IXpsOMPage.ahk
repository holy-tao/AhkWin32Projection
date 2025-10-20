#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getowner
     */
    GetOwner(pageReference) {
        result := ComCall(5, this, "ptr*", pageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMVisualCollection>} visuals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getvisuals
     */
    GetVisuals(visuals) {
        result := ComCall(6, this, "ptr*", visuals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getpagedimensions
     */
    GetPageDimensions(pageDimensions) {
        result := ComCall(7, this, "ptr", pageDimensions, "HRESULT")
        return result
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
     * @param {Pointer<XPS_RECT>} contentBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getcontentbox
     */
    GetContentBox(contentBox) {
        result := ComCall(9, this, "ptr", contentBox, "HRESULT")
        return result
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
     * @param {Pointer<XPS_RECT>} bleedBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getbleedbox
     */
    GetBleedBox(bleedBox) {
        result := ComCall(11, this, "ptr", bleedBox, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getlanguage
     */
    GetLanguage(language) {
        result := ComCall(13, this, "ptr", language, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getname
     */
    GetName(name) {
        result := ComCall(15, this, "ptr", name, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} isHyperlinkTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getishyperlinktarget
     */
    GetIsHyperlinkTarget(isHyperlinkTarget) {
        result := ComCall(17, this, "ptr", isHyperlinkTarget, "HRESULT")
        return result
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
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionary
     */
    GetDictionary(resourceDictionary) {
        result := ComCall(19, this, "ptr*", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal
     */
    GetDictionaryLocal(resourceDictionary) {
        result := ComCall(20, this, "ptr*", resourceDictionary, "HRESULT")
        return result
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
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource
     */
    GetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(22, this, "ptr*", remoteDictionaryResource, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-generateunusedlookupkey
     */
    GenerateUnusedLookupKey(type, key) {
        result := ComCall(25, this, "int", type, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-clone
     */
    Clone(page) {
        result := ComCall(26, this, "ptr*", page, "HRESULT")
        return result
    }
}
