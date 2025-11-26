#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMImageResource.ahk
#Include .\IXpsOMColorProfileResource.ahk
#Include .\IXpsOMImageBrush.ahk
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
     * Gets a pointer to the IXpsOMImageResource interface, which contains the image resource to be used as the source for the brush.
     * @returns {IXpsOMImageResource} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the image resource to be used as the source for the brush.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getimageresource
     */
    GetImageResource() {
        result := ComCall(18, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Sets a pointer to the IXpsOMImageResource interface that contains the image resource to be used as the source for the brush.
     * @param {IXpsOMImageResource} imageResource The image resource to be used as the source for the brush. This parameter must not be a <b>NULL</b> pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>imageResource</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>imageResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setimageresource
     */
    SetImageResource(imageResource) {
        result := ComCall(19, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMColorProfileResource interface, which contains the color profile resource that is associated with the image.
     * @returns {IXpsOMColorProfileResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface that contains the color profile resource that is associated with the image. If no color profile resource has been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getcolorprofileresource
     */
    GetColorProfileResource() {
        result := ComCall(20, this, "ptr*", &colorProfileResource := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfileResource)
    }

    /**
     * Sets a pointer to the IXpsOMColorProfileResource interface, which contains the color profile resource that is associated with the image.
     * @param {IXpsOMColorProfileResource} colorProfileResource The color profile resource that is associated with the image. A <b>NULL</b> pointer will release any previously set color profile resources.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>colorProfileResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setcolorprofileresource
     */
    SetColorProfileResource(colorProfileResource) {
        result := ComCall(21, this, "ptr", colorProfileResource, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMImageBrush} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-clone
     */
    Clone() {
        result := ComCall(22, this, "ptr*", &imageBrush := 0, "HRESULT")
        return IXpsOMImageBrush(imageBrush)
    }
}
