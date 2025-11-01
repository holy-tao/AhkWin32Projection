#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMTileBrush.ahk

/**
 * A brush that uses a raster image as a source.
 * @remarks
 * 
  * The image used by this brush is defined in a coordinate space that is specified by the image's resolution. The image type must be JPEG, PNG, TIFF 6.0, or HD  Photo.
  * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMImageBrush            *newInterface;
  * // The following values are defined outside of 
  * // this example.
  * //  IXpsOMImageResource     *image;
  * //  XPS_RECT                viewBox;
  * //  XPS_RECT                viewPort;
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
  *     hr = xpsFactory->CreateImageBrush (
  *         image,
  *         &viewBox,
  *         &viewPort,
  *         &newInterface);
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomimagebrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMImageBrush extends IXpsOMTileBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMImageBrush
     * @type {Guid}
     */
    static IID => Guid("{3df0b466-d382-49ef-8550-dd94c80242e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageResource", "SetImageResource", "GetColorProfileResource", "SetColorProfileResource", "Clone"]

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getimageresource
     */
    GetImageResource(imageResource) {
        result := ComCall(18, this, "ptr*", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setimageresource
     */
    SetImageResource(imageResource) {
        result := ComCall(19, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfileResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getcolorprofileresource
     */
    GetColorProfileResource(colorProfileResource) {
        result := ComCall(20, this, "ptr*", colorProfileResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMColorProfileResource} colorProfileResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setcolorprofileresource
     */
    SetColorProfileResource(colorProfileResource) {
        result := ComCall(21, this, "ptr", colorProfileResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageBrush>} imageBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-clone
     */
    Clone(imageBrush) {
        result := ComCall(22, this, "ptr*", imageBrush, "HRESULT")
        return result
    }
}
