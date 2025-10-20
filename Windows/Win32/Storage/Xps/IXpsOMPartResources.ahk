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
     * 
     * @param {Pointer<IXpsOMFontResourceCollection>} fontResources 
     * @returns {HRESULT} 
     */
    GetFontResources(fontResources) {
        result := ComCall(3, this, "ptr", fontResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResourceCollection>} imageResources 
     * @returns {HRESULT} 
     */
    GetImageResources(imageResources) {
        result := ComCall(4, this, "ptr", imageResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMColorProfileResourceCollection>} colorProfileResources 
     * @returns {HRESULT} 
     */
    GetColorProfileResources(colorProfileResources) {
        result := ComCall(5, this, "ptr", colorProfileResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResourceCollection>} dictionaryResources 
     * @returns {HRESULT} 
     */
    GetRemoteDictionaryResources(dictionaryResources) {
        result := ComCall(6, this, "ptr", dictionaryResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
