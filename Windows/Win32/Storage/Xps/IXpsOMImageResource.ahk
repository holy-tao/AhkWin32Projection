#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an IStream interface to an image resource.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMImageResource    *newInterface;
  * // The following values are defined outside of 
  * // this example.
  * //  IStream            *acquiredStream;
  * //  XPS_IMAGE_TYPE     contentType;
  * //  IOpcPartUri        *partUri;
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
  *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
  *     if (SUCCEEDED(hr))
  *     {
  *         hr = xpsFactory->CreateImageResource (
  *             acquiredStream,
  *             contentType,
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMImageResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMImageResource
     * @type {Guid}
     */
    static IID => Guid("{3db8417d-ae50-485e-9a44-d7758f78a23f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream", "SetContent", "GetImageType"]

    /**
     * 
     * @param {Pointer<IStream>} readerStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-getstream
     */
    GetStream(readerStream) {
        result := ComCall(5, this, "ptr*", readerStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} sourceStream 
     * @param {Integer} imageType 
     * @param {IOpcPartUri} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-setcontent
     */
    SetContent(sourceStream, imageType, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "int", imageType, "ptr", partName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} imageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-getimagetype
     */
    GetImageType(imageType) {
        result := ComCall(7, this, "int*", imageType, "HRESULT")
        return result
    }
}
