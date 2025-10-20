#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisual.ahk

/**
 * A group of visual elements and related properties.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomcanvas
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMCanvas extends IXpsOMVisual{
    /**
     * The interface identifier for IXpsOMCanvas
     * @type {Guid}
     */
    static IID => Guid("{221d1452-331e-47c6-87e9-6ccefb9b5ba3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * 
     * @param {Pointer<IXpsOMVisualCollection>} visuals 
     * @returns {HRESULT} 
     */
    GetVisuals(visuals) {
        result := ComCall(30, this, "ptr", visuals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} useAliasedEdgeMode 
     * @returns {HRESULT} 
     */
    GetUseAliasedEdgeMode(useAliasedEdgeMode) {
        result := ComCall(31, this, "ptr", useAliasedEdgeMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} useAliasedEdgeMode 
     * @returns {HRESULT} 
     */
    SetUseAliasedEdgeMode(useAliasedEdgeMode) {
        result := ComCall(32, this, "int", useAliasedEdgeMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} shortDescription 
     * @returns {HRESULT} 
     */
    GetAccessibilityShortDescription(shortDescription) {
        result := ComCall(33, this, "ptr", shortDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} shortDescription 
     * @returns {HRESULT} 
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(34, this, "ptr", shortDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} longDescription 
     * @returns {HRESULT} 
     */
    GetAccessibilityLongDescription(longDescription) {
        result := ComCall(35, this, "ptr", longDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} longDescription 
     * @returns {HRESULT} 
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(36, this, "ptr", longDescription, "int")
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
        result := ComCall(37, this, "ptr", resourceDictionary, "int")
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
        result := ComCall(38, this, "ptr", resourceDictionary, "int")
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
        result := ComCall(39, this, "ptr", resourceDictionary, "int")
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
        result := ComCall(40, this, "ptr", remoteDictionaryResource, "int")
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
        result := ComCall(41, this, "ptr", remoteDictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCanvas>} canvas 
     * @returns {HRESULT} 
     */
    Clone(canvas) {
        result := ComCall(42, this, "ptr", canvas, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
