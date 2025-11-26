#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGradientBrush.ahk
#Include .\IXpsOMColorProfileResource.ahk
#Include .\IXpsOMGradientStop.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a single color and location within a gradient.
 * @remarks
 * 
 * A gradient stop is a specific color that  is defined for a location within the gradient region. The color of the gradient changes between the gradient stops of the gradient. The area and absolute location of the gradient is defined by the gradient interface.   The offset is a relative location within the gradient region and is measured between 0.0 and 1.0. An offset of  0.0 is the beginning of the gradient and 1.0 is the end. Gradient stops can be defined for any offset within the range, including the end points. This interface describes one and only one stop in a gradient.
 * 
 * The gradient path is the straight line that connects the start point and the end point of a linear gradient. The gradient region of a linear gradient consists of the area between the start point and the end point, including those points, and extends in both directions at a right angle to the gradient path. The spread area is the area outside the gradient region. 
 * 
 * Gradient stops  define the color at a specific location along the gradient path; the color is interpolated along the gradient path between the gradient stops. In the example that follows, the gradient region fills the image, so there is no spread area.
 * 
 * For gradient stops used in linear-gradient brushes, the offset value of 0.0 corresponds to the start point of the gradient path, and the offset value of 1.0 corresponds to the end point. To determine the location of a gradient stop between these two points, intermediate offset values are interpolated between them. The following illustration shows two intermediate gradient stops, one at an offset of 0.25 and another at 0.75.
 * 
 * <img alt="A figure that shows the terms used in a linear gradient" src="./images/LinearGradient2.png"/>
 * 
 * 
 * For gradient stops used in radial-gradient brushes, the offset value of 0.0 corresponds to the gradient origin location, and the offset value of 1.0 corresponds to the circumference of the ellipse that bounds the gradient. Offsets between 0.0 and 1.0 define an ellipse that is interpolated between the gradient origin  and the bounding ellipse. The illustration  that follows has one intermediate gradient stop at an offset of 0.50 (Gradient stop 1). The gradient  is using the <b>XPS_SPREAD_METHOD_REFLECT</b> spread method to fill the space outside of the gradient region.
 * 
 * <img alt="A figure that shows the terms used in a radial gradient" src="./images/RadialGradient2.png"/>
 * The calculations that are used to render a gradient are  described  in the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMGradientStop    *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  XPS_COLOR                    color;
 * //  IXpsOMColorProfileResource    *colorProfile;
 * //  FLOAT                        offset;
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
 *     hr = xpsFactory->CreateGradientStop (
 *         &color,
 *         colorProfile,
 *         offset,
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGradientStop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGradientStop
     * @type {Guid}
     */
    static IID => Guid("{5cf4f5cc-3969-49b5-a70a-5550b618fe49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetOffset", "SetOffset", "GetColor", "SetColor", "Clone"]

    /**
     * Gets a pointer to the IXpsOMGradientBrush interface that contains the gradient stop.
     * @returns {IXpsOMGradientBrush} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientbrush">IXpsOMGradientBrush</a> interface that contains the gradient stop. If the gradient stop is not assigned to a gradient brush, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMGradientBrush(owner)
    }

    /**
     * Gets the offset value of the gradient stop.
     * @returns {Float} The offset value of the gradient stop, expressed as a fraction of the gradient path.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getoffset
     */
    GetOffset() {
        result := ComCall(4, this, "float*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * Sets the offset location of the gradient stop.
     * @param {Float} offset The offset value that describes the location of the gradient stop as a fraction of the gradient path.
     * 
     * The valid range of this parameter is 0.0 &lt;= <i>offset</i> &lt;= 1.0.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>offset</i> did not contain a valid offset value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-setoffset
     */
    SetOffset(offset) {
        result := ComCall(5, this, "float", offset, "HRESULT")
        return result
    }

    /**
     * Gets the color value and color profile of the gradient stop.
     * @param {Pointer<XPS_COLOR>} color The color value of the gradient stop.
     * @returns {IXpsOMColorProfileResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface that contains the color profile to be used. If no color profile resource has been set, a <b>NULL</b> pointer is returned. See remarks.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getcolor
     */
    GetColor(color) {
        result := ComCall(6, this, "ptr", color, "ptr*", &colorProfile := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfile)
    }

    /**
     * Sets the color value and color profile of the gradient stop.
     * @param {Pointer<XPS_COLOR>} color The color value to be set at the gradient stop.
     * 
     * If the value of the <b>colorType</b> field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372939(v=vs.85)">XPS_COLOR</a> structure that is passed in this parameter is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>, a valid color profile must be provided in the <i>colorProfile</i> parameter.
     * @param {IXpsOMColorProfileResource} colorProfile The color profile to be used with <i>color</i>.
     * 
     * A color profile is required when the value of the <b>colorType</b> field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372939(v=vs.85)">XPS_COLOR</a> structure that is passed  in the <i>color</i> parameter is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>. If the value of the <b>colorType</b> field is not <b>XPS_COLOR_TYPE_CONTEXT</b>, this parameter must be set to <b>NULL</b>.
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
     * <i>colorProfile</i> is <b>NULL</b> when a color profile was expected. A color profile is required when the color type is <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_UNEXPECTED_COLORPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>colorProfile</i> contained a color profile when one was not expected. A color profile is only allowed when the color type is <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_type">XPS_COLOR_TYPE_CONTEXT</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-setcolor
     */
    SetColor(color, colorProfile) {
        result := ComCall(7, this, "ptr", color, "ptr", colorProfile, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the IXpsOMGradientStop interface.
     * @returns {IXpsOMGradientStop} A pointer to the copy of the  interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-clone
     */
    Clone() {
        result := ComCall(8, this, "ptr*", &gradientStop := 0, "HRESULT")
        return IXpsOMGradientStop(gradientStop)
    }
}
