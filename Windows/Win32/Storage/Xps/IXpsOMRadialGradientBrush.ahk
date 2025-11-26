#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_POINT.ahk
#Include .\XPS_SIZE.ahk
#Include .\IXpsOMRadialGradientBrush.ahk
#Include .\IXpsOMGradientBrush.ahk

/**
 * Specifies a radial gradient.
 * @remarks
 * 
 *   As shown in the figure that follows, the gradient region of a radial gradient is the area enclosed by the ellipse that is described by the center point and the x and y radii that extend from the center point. The spread area is the area outside of that ellipse. The gradient path (not shown) is a radial line that is drawn between the gradient origin and the ellipse that bounds the gradient region.
 * 
 * <img alt="A figure that shows the terms used in a radial gradient" src="./images/RadialGradient1.png"/>
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMRadialGradientBrush    *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  IXpsOMGradientStop       *gradStop1, *gradStop2;
 * //  XPS_POINT                centerPoint, gradientOrigin;
 * //  XPS_SIZE                 radiiSizes;
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
 *     hr = xpsFactory->CreateRadialGradientBrush (
 *         gradStop1,
 *         gradStop2,
 *         &centerPoint,
 *         &gradientOrigin,
 *         &radiiSizes,
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomradialgradientbrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMRadialGradientBrush extends IXpsOMGradientBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMRadialGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{75f207e5-08bf-413c-96b1-b82b4064176b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCenter", "SetCenter", "GetRadiiSizes", "SetRadiiSizes", "GetGradientOrigin", "SetGradientOrigin", "Clone"]

    /**
     * Gets the center point of the radial gradient region ellipse.
     * @returns {XPS_POINT} The x and y coordinates of the center point of the radial gradient region ellipse.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getcenter
     */
    GetCenter() {
        center := XPS_POINT()
        result := ComCall(17, this, "ptr", center, "HRESULT")
        return center
    }

    /**
     * Sets the center point of the radial gradient region ellipse.
     * @param {Pointer<XPS_POINT>} center The x and y coordinates to be set for the center point of the radial gradient ellipse.
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
     * The point described by <i>center</i> is not valid. The <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure must contain valid and finite floating-point values.
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
     * <i>center</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setcenter
     */
    SetCenter(center) {
        result := ComCall(18, this, "ptr", center, "HRESULT")
        return result
    }

    /**
     * Gets the sizes of the radii that define the ellipse of the radial gradient region.
     * @returns {XPS_SIZE} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that  receives the sizes of the radii.
     * 
     * <table>
     * <tr>
     * <th>Field</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * <b>width</b>
     * 
     * </td>
     * <td>
     * Size of the radius along the x-axis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>height</b>
     * 
     * </td>
     * <td>
     * Size of the radius along the y-axis.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Size is described in XPS units. There are 96 XPS units per inch. For example, a 1" radius is 96 XPS units.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getradiisizes
     */
    GetRadiiSizes() {
        radiiSizes := XPS_SIZE()
        result := ComCall(19, this, "ptr", radiiSizes, "HRESULT")
        return radiiSizes
    }

    /**
     * Sets the sizes of the radii that define ellipse of the radial gradient region.
     * @param {Pointer<XPS_SIZE>} radiiSizes The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure that  receives the sizes of the radii.
     * 
     * <table>
     * <tr>
     * <th>Field</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * <b>width</b>
     * 
     * </td>
     * <td>
     * Size of the radius along the x-axis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>height</b>
     * 
     * </td>
     * <td>
     * Size of the radius along the y-axis.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Size is described in XPS units. There are 96 XPS units per inch. For example, a 1" radius is 96 XPS units.
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
     * One of the sizes described by <i>radiiSizes</i> is not valid. The <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure must contain valid, finite, and non-negative floating-point values.
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
     * <i>radiiSizes</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setradiisizes
     */
    SetRadiiSizes(radiiSizes) {
        result := ComCall(20, this, "ptr", radiiSizes, "HRESULT")
        return result
    }

    /**
     * Gets the origin point of the radial gradient.
     * @returns {XPS_POINT} The x and y coordinates of the radial gradient's origin point.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getgradientorigin
     */
    GetGradientOrigin() {
        origin := XPS_POINT()
        result := ComCall(21, this, "ptr", origin, "HRESULT")
        return origin
    }

    /**
     * Sets the origin point of the radial gradient.
     * @param {Pointer<XPS_POINT>} origin The x and y  coordinates to be set for the origin point of the  radial gradient.
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
     * The point described by <i>origin</i> was not valid. The <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure must contain valid and finite floating-point values.
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
     * <i>origin</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setgradientorigin
     */
    SetGradientOrigin(origin) {
        result := ComCall(22, this, "ptr", origin, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMRadialGradientBrush} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return IXpsOMRadialGradientBrush(radialGradientBrush)
    }
}
