#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an IStream interface to a color profile resource.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMColorProfileResource    *newInterface;
  * IOpcPartUri                   *partUri;
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
  *     // The partUriString and acquiredStream variables 
  *     //   are defined outside of this example.
  *     hr = xpsFactory->CreatePartUri(
  *         partUriString, 
  *         &partUri);
  *     if (SUCCEEDED(hr))
  *     {
  *         hr = xpsFactory->CreateColorProfileResource (
  *             acquiredStream, 
  *             partUri,
  *             &newInterface);
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMColorProfileResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMColorProfileResource
     * @type {Guid}
     */
    static IID => Guid("{67bd7d69-1eef-4bb1-b5e7-6f4f87be8abe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream", "SetContent"]

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresource-getstream
     */
    GetStream(stream) {
        result := ComCall(5, this, "ptr*", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} sourceStream 
     * @param {IOpcPartUri} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresource-setcontent
     */
    SetContent(sourceStream, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "ptr", partName, "HRESULT")
        return result
    }
}
