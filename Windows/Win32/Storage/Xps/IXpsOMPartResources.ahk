#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to all shared, part-based resources of the XPS document.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPartResources extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPartResources
     * @type {Guid}
     */
    static IID => Guid("{f4cf7729-4864-4275-99b3-a8717163ecaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontResources", "GetImageResources", "GetColorProfileResources", "GetRemoteDictionaryResources"]

    /**
     * 
     * @param {Pointer<IXpsOMFontResourceCollection>} fontResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getfontresources
     */
    GetFontResources(fontResources) {
        result := ComCall(3, this, "ptr*", fontResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResourceCollection>} imageResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getimageresources
     */
    GetImageResources(imageResources) {
        result := ComCall(4, this, "ptr*", imageResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMColorProfileResourceCollection>} colorProfileResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getcolorprofileresources
     */
    GetColorProfileResources(colorProfileResources) {
        result := ComCall(5, this, "ptr*", colorProfileResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResourceCollection>} dictionaryResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getremotedictionaryresources
     */
    GetRemoteDictionaryResources(dictionaryResources) {
        result := ComCall(6, this, "ptr*", dictionaryResources, "HRESULT")
        return result
    }
}
