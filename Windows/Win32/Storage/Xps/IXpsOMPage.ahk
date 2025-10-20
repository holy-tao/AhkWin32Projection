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
     * 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     */
    GetOwner(pageReference) {
        result := ComCall(5, this, "ptr", pageReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMVisualCollection>} visuals 
     * @returns {HRESULT} 
     */
    GetVisuals(visuals) {
        result := ComCall(6, this, "ptr", visuals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     */
    GetPageDimensions(pageDimensions) {
        result := ComCall(7, this, "ptr", pageDimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @returns {HRESULT} 
     */
    SetPageDimensions(pageDimensions) {
        result := ComCall(8, this, "ptr", pageDimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} contentBox 
     * @returns {HRESULT} 
     */
    GetContentBox(contentBox) {
        result := ComCall(9, this, "ptr", contentBox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} contentBox 
     * @returns {HRESULT} 
     */
    SetContentBox(contentBox) {
        result := ComCall(10, this, "ptr", contentBox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} bleedBox 
     * @returns {HRESULT} 
     */
    GetBleedBox(bleedBox) {
        result := ComCall(11, this, "ptr", bleedBox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} bleedBox 
     * @returns {HRESULT} 
     */
    SetBleedBox(bleedBox) {
        result := ComCall(12, this, "ptr", bleedBox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(13, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(14, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(15, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(16, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isHyperlinkTarget 
     * @returns {HRESULT} 
     */
    GetIsHyperlinkTarget(isHyperlinkTarget) {
        result := ComCall(17, this, "ptr", isHyperlinkTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isHyperlinkTarget 
     * @returns {HRESULT} 
     */
    SetIsHyperlinkTarget(isHyperlinkTarget) {
        result := ComCall(18, this, "int", isHyperlinkTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     */
    GetDictionary(resourceDictionary) {
        result := ComCall(19, this, "ptr", resourceDictionary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     */
    GetDictionaryLocal(resourceDictionary) {
        result := ComCall(20, this, "ptr", resourceDictionary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     */
    SetDictionaryLocal(resourceDictionary) {
        result := ComCall(21, this, "ptr", resourceDictionary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     */
    GetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(22, this, "ptr", remoteDictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     */
    SetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(23, this, "ptr", remoteDictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISequentialStream>} stream 
     * @param {BOOL} optimizeMarkupSize 
     * @returns {HRESULT} 
     */
    Write(stream, optimizeMarkupSize) {
        result := ComCall(24, this, "ptr", stream, "int", optimizeMarkupSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GenerateUnusedLookupKey(type, key) {
        result := ComCall(25, this, "int", type, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     */
    Clone(page) {
        result := ComCall(26, this, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
