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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisuals", "GetUseAliasedEdgeMode", "SetUseAliasedEdgeMode", "GetAccessibilityShortDescription", "SetAccessibilityShortDescription", "GetAccessibilityLongDescription", "SetAccessibilityLongDescription", "GetDictionary", "GetDictionaryLocal", "SetDictionaryLocal", "GetDictionaryResource", "SetDictionaryResource", "Clone"]

    /**
     * 
     * @param {Pointer<IXpsOMVisualCollection>} visuals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getvisuals
     */
    GetVisuals(visuals) {
        result := ComCall(30, this, "ptr*", visuals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} useAliasedEdgeMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getusealiasededgemode
     */
    GetUseAliasedEdgeMode(useAliasedEdgeMode) {
        result := ComCall(31, this, "ptr", useAliasedEdgeMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} useAliasedEdgeMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setusealiasededgemode
     */
    SetUseAliasedEdgeMode(useAliasedEdgeMode) {
        result := ComCall(32, this, "int", useAliasedEdgeMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} shortDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getaccessibilityshortdescription
     */
    GetAccessibilityShortDescription(shortDescription) {
        result := ComCall(33, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} shortDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setaccessibilityshortdescription
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(34, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} longDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getaccessibilitylongdescription
     */
    GetAccessibilityLongDescription(longDescription) {
        result := ComCall(35, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} longDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setaccessibilitylongdescription
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(36, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionary
     */
    GetDictionary(resourceDictionary) {
        result := ComCall(37, this, "ptr*", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionarylocal
     */
    GetDictionaryLocal(resourceDictionary) {
        result := ComCall(38, this, "ptr*", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMDictionary} resourceDictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal
     */
    SetDictionaryLocal(resourceDictionary) {
        result := ComCall(39, this, "ptr", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionaryresource
     */
    GetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(40, this, "ptr*", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMRemoteDictionaryResource} remoteDictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource
     */
    SetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(41, this, "ptr", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCanvas>} canvas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-clone
     */
    Clone(canvas) {
        result := ComCall(42, this, "ptr*", canvas, "HRESULT")
        return result
    }
}
