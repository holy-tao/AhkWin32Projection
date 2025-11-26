#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMFontResourceCollection.ahk
#Include .\IXpsOMImageResourceCollection.ahk
#Include .\IXpsOMColorProfileResourceCollection.ahk
#Include .\IXpsOMRemoteDictionaryResourceCollection.ahk
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
     * Gets the IXpsOMFontResourceCollection interface that contains the fonts that are used in the XPS document.
     * @returns {IXpsOMFontResourceCollection} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresourcecollection">IXpsOMFontResourceCollection</a> interface that contains the fonts that are used in the XPS document.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getfontresources
     */
    GetFontResources() {
        result := ComCall(3, this, "ptr*", &fontResources := 0, "HRESULT")
        return IXpsOMFontResourceCollection(fontResources)
    }

    /**
     * Gets the IXpsOMImageResourceCollection interface that contains the images that are used in the XPS document.
     * @returns {IXpsOMImageResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresourcecollection">IXpsOMImageResourceCollection</a> interface that contains the images that are used in the XPS document.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getimageresources
     */
    GetImageResources() {
        result := ComCall(4, this, "ptr*", &imageResources := 0, "HRESULT")
        return IXpsOMImageResourceCollection(imageResources)
    }

    /**
     * Gets the IXpsOMColorProfileResourceCollection interface that contains the color profiles that are used in the XPS document.
     * @returns {IXpsOMColorProfileResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresourcecollection">IXpsOMColorProfileResourceCollection</a> interface that contains  the color profiles that are used in the XPS document.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getcolorprofileresources
     */
    GetColorProfileResources() {
        result := ComCall(5, this, "ptr*", &colorProfileResources := 0, "HRESULT")
        return IXpsOMColorProfileResourceCollection(colorProfileResources)
    }

    /**
     * Gets the IXpsOMRemoteDictionaryResourceCollection interface that contains the remote resource dictionaries that are used in the XPS document.
     * @returns {IXpsOMRemoteDictionaryResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresourcecollection">IXpsOMRemoteDictionaryResourceCollection</a> interface that  contains the remote resource dictionaries that are used in the XPS document.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getremotedictionaryresources
     */
    GetRemoteDictionaryResources() {
        result := ComCall(6, this, "ptr*", &dictionaryResources := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResourceCollection(dictionaryResources)
    }
}
