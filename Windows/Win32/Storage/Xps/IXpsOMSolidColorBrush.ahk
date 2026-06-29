#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMColorProfileResource.ahk" { IXpsOMColorProfileResource }
#Import ".\IXpsOMBrush.ahk" { IXpsOMBrush }
#Import ".\XPS_COLOR.ahk" { XPS_COLOR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * A single-color brush.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMSolidColorBrush             *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  XPS_COLOR                     color;
 * //  IXpsOMColorProfileResource    *colorProfile;
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
 *     hr = xpsFactory->CreateSolidColorBrush (
 *         &color,
 *         colorProfile,
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
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsolidcolorbrush
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMSolidColorBrush extends IXpsOMBrush {
    /**
     * The interface identifier for IXpsOMSolidColorBrush
     * @type {Guid}
     */
    static IID := Guid("{a06f9f05-3be9-4763-98a8-094fc672e488}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMSolidColorBrush interfaces
    */
    struct Vtbl extends IXpsOMBrush.Vtbl {
        GetColor : IntPtr
        SetColor : IntPtr
        Clone    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMSolidColorBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the color value and color profile of the brush.
     * @param {Pointer<XPS_COLOR>} _color The color value of the brush.
     * @returns {IXpsOMColorProfileResource} The color profile of the brush. 
     * 
     * If no color profile has been specified for the brush, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-getcolor
     */
    GetColor(_color) {
        result := ComCall(7, this, XPS_COLOR.Ptr, _color, "ptr*", &colorProfile := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfile)
    }

    /**
     * Sets the color value and color profile of the brush.
     * @param {Pointer<XPS_COLOR>} _color The color value of the brush. 
     * 
     * If the value of the <b>colorType</b> field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372939(v=vs.85)">XPS_COLOR</a> structure that is passed in this parameter is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>, a valid color profile must be provided in the <i>colorProfile</i> parameter.
     * @param {IXpsOMColorProfileResource} colorProfile The color profile to be used with <i>color</i>.
     * 
     * A color profile is required when the value of the <b>colorType</b> field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372939(v=vs.85)">XPS_COLOR</a> structure that is passed  in the <i>color</i> parameter is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>. If the value of the <b>colorType</b> field is not <b>XPS_COLOR_TYPE_CONTEXT</b>, this parameter must be set to <b>NULL</b>.
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
     * <i>color</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MISSING_COLORPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>colorProfile</i> is <b>NULL</b> when a color profile is expected. A color profile is required when the color type is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_UNEXPECTED_COLORPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>colorProfile</i> has a color profile when none is expected. A color profile is only allowed when the color type is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>.
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
     * <i>colorProfile</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-setcolor
     */
    SetColor(_color, colorProfile) {
        result := ComCall(8, this, XPS_COLOR.Ptr, _color, "ptr", colorProfile, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMSolidColorBrush.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy.
     * @returns {IXpsOMSolidColorBrush} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &solidColorBrush := 0, "HRESULT")
        return IXpsOMSolidColorBrush(solidColorBrush)
    }

    Query(iid) {
        if (IXpsOMSolidColorBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColor := CallbackCreate(GetMethod(implObj, "GetColor"), flags, 3)
        this.vtbl.SetColor := CallbackCreate(GetMethod(implObj, "SetColor"), flags, 3)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColor)
        CallbackFree(this.vtbl.SetColor)
        CallbackFree(this.vtbl.Clone)
    }
}
