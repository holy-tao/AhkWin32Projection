#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMTileBrush.ahk" { IXpsOMTileBrush }
#Import ".\IXpsOMColorProfileResource.ahk" { IXpsOMColorProfileResource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMImageResource.ahk" { IXpsOMImageResource }

/**
 * A brush that uses a raster image as a source.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimagebrush
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMImageBrush extends IXpsOMTileBrush {
    /**
     * The interface identifier for IXpsOMImageBrush
     * @type {Guid}
     */
    static IID := Guid("{3df0b466-d382-49ef-8550-dd94c80242e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMImageBrush interfaces
    */
    struct Vtbl extends IXpsOMTileBrush.Vtbl {
        GetImageResource        : IntPtr
        SetImageResource        : IntPtr
        GetColorProfileResource : IntPtr
        SetColorProfileResource : IntPtr
        Clone                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMImageBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the IXpsOMImageResource interface, which contains the image resource to be used as the source for the brush.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMImageResource} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the image resource to be used as the source for the brush.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getimageresource
     */
    GetImageResource() {
        result := ComCall(18, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Sets a pointer to the IXpsOMImageResource interface that contains the image resource to be used as the source for the brush.
     * @remarks
     * The image resource must be of type JPEG, PNG, TIFF 6.0, or HD  Photo.
     * @param {IXpsOMImageResource} imageResource The image resource to be used as the source for the brush. This parameter must not be a <b>NULL</b> pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setimageresource
     */
    SetImageResource(imageResource) {
        result := ComCall(19, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMColorProfileResource interface, which contains the color profile resource that is associated with the image.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMColorProfileResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface that contains the color profile resource that is associated with the image. If no color profile resource has been set, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-getcolorprofileresource
     */
    GetColorProfileResource() {
        result := ComCall(20, this, "ptr*", &colorProfileResource := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfileResource)
    }

    /**
     * Sets a pointer to the IXpsOMColorProfileResource interface, which contains the color profile resource that is associated with the image.
     * @param {IXpsOMColorProfileResource} colorProfileResource The color profile resource that is associated with the image. A <b>NULL</b> pointer will release any previously set color profile resources.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-setcolorprofileresource
     */
    SetColorProfileResource(colorProfileResource) {
        result := ComCall(21, this, "ptr", colorProfileResource, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMImageBrush.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy.
     * @returns {IXpsOMImageBrush} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimagebrush-clone
     */
    Clone() {
        result := ComCall(22, this, "ptr*", &imageBrush := 0, "HRESULT")
        return IXpsOMImageBrush(imageBrush)
    }

    Query(iid) {
        if (IXpsOMImageBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageResource := CallbackCreate(GetMethod(implObj, "GetImageResource"), flags, 2)
        this.vtbl.SetImageResource := CallbackCreate(GetMethod(implObj, "SetImageResource"), flags, 2)
        this.vtbl.GetColorProfileResource := CallbackCreate(GetMethod(implObj, "GetColorProfileResource"), flags, 2)
        this.vtbl.SetColorProfileResource := CallbackCreate(GetMethod(implObj, "SetColorProfileResource"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageResource)
        CallbackFree(this.vtbl.SetImageResource)
        CallbackFree(this.vtbl.GetColorProfileResource)
        CallbackFree(this.vtbl.SetColorProfileResource)
        CallbackFree(this.vtbl.Clone)
    }
}
