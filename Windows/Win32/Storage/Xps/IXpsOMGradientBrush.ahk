#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGradientStopCollection.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMBrush.ahk

/**
 * This interface describes a gradient that is made up of gradient stops. Classes that inherit from IXpsOMGradientBrush specify different ways of interpreting gradient stops.
 * @remarks
 * 
 * The methods of this interface define the basic parameters of a gradient. The gradient type, which can be linear or radial,  determines how these parameters are applied.
 * 
 * As shown in the figure that follows, the start and end points of a linear gradient mark the end points of the gradient path. The gradient path is the straight line that connects the start and end points. The gradient region of a linear gradient consists of the area between the start and end points, including those points, and extends in both directions at a right angle to the gradient path. The spread area is the area outside the gradient region.
 * 
 * Gradient stops  define the color at specific locations along the gradient path; the color is interpolated along the gradient path between the gradient stops, as shown in the following illustration.
 * 
 * <img alt="A figure that shows the terms used in a linear gradient" src="./images/LinearGradient1.png"/>
 * As shown in the figure that follows, the gradient region of a radial gradient is the area enclosed by the ellipse that is described by the center point and the x and y radii that extend from the center point. The spread area is the area outside of that ellipse. The gradient path is a radial line that sweeps the entire gradient region from the gradient origin to the ellipse that bounds the gradient region. In the following illustration, the gradient path is not shown.
 * 
 * <img alt="A figure that shows the terms used in a radial gradient" src="./images/RadialGradient1.png"/>
 * The spread method describes how the spread area is filled. Implementation of the spread method depends on the gradient type (linear or radial). The following illustration shows several examples of how the spread area can be filled. For  information about different spread methods, see <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_spread_method">XPS_SPREAD_METHOD</a>.
 * 
 * <img alt="An illustration that shows examples of the spread method" src="./images/XPS_Spread_Method.png"/>
 *  The transform  determines how the resulting gradient is transformed. The visible part of the gradient that is ultimately rendered in the image is determined by the path, stroke, or glyph that is using the gradient brush.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientbrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGradientBrush extends IXpsOMBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{edb59622-61a2-42c3-bace-acf2286c06bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGradientStops", "GetTransform", "GetTransformLocal", "SetTransformLocal", "GetTransformLookup", "SetTransformLookup", "GetSpreadMethod", "SetSpreadMethod", "GetColorInterpolationMode", "SetColorInterpolationMode"]

    /**
     * Gets a pointer to an IXpsOMGradientStopCollection interface that contains the collection of IXpsOMGradientStop interfaces that define the gradient.
     * @returns {IXpsOMGradientStopCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstopcollection">IXpsOMGradientStopCollection</a> interface that contains the collection of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstop">IXpsOMGradientStop</a> interfaces.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getgradientstops
     */
    GetGradientStops() {
        result := ComCall(7, this, "ptr*", &gradientStops := 0, "HRESULT")
        return IXpsOMGradientStopCollection(gradientStops)
    }

    /**
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the resolved matrix transform for the brush.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface that contains the resolved matrix transform for the brush. If  the  transform has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has been most recently called to set the transform.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>transform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared transform that is retrieved, with a lookup key that matches the key set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransform
     */
    GetTransform() {
        result := ComCall(8, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the local, unshared, resolved matrix transform for the brush.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface  that contains the local, unshared, resolved matrix transform for the brush. If  the transform has not been set or if a matrix transform lookup key has been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has been most recently called to set the transform.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>transform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(9, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * Sets the IXpsOMMatrixTransform interface pointer to a local, unshared matrix transform that is to be used for the brush.
     * @param {IXpsOMMatrixTransform} transform A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface of the local, unshared matrix transform that is to be used for the brush. A <b>NULL</b> pointer releases any previously set interface.
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
     * <i>transform</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal
     */
    SetTransformLocal(transform) {
        result := ComCall(10, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Gets the name of the lookup key of the shared matrix transform interface that is to be used for the brush.
     * @returns {PWSTR} The name of the lookup key  of the shared matrix transform interface that is to be used for the brush. If the lookup key name has not been set or if the local matrix transform has  been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has been most recently called to set the lookup key or the transform.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>String that is returned in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(11, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Sets the name of the lookup key of a shared matrix transform that is to be used for the brush.
     * @param {PWSTR} key The name of the lookup key of the matrix transform that is to be used for the brush.
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
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>key</i> references an object that is not a geometry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(12, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets the XPS_SPREAD_METHOD value, which describes how the area outside of the gradient region will be rendered.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_spread_method">XPS_SPREAD_METHOD</a> value that describes how the area outside of the gradient region will be rendered. The gradient region is defined by the linear-gradient brush or radial-gradient brush that inherits this interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getspreadmethod
     */
    GetSpreadMethod() {
        result := ComCall(13, this, "int*", &spreadMethod := 0, "HRESULT")
        return spreadMethod
    }

    /**
     * Sets the XPS_SPREAD_METHOD value, which describes how the area outside of the gradient region is to be rendered.
     * @param {Integer} spreadMethod The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_spread_method">XPS_SPREAD_METHOD</a> value that describes how the area outside of the gradient region  is to be rendered. The gradient region is defined by the linear-gradient brush or radial-gradient brush that inherits this interface.
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
     * The <i>spreadMethod</i> parameter was not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_spread_method">XPS_SPREAD_METHOD</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-setspreadmethod
     */
    SetSpreadMethod(spreadMethod) {
        result := ComCall(14, this, "int", spreadMethod, "HRESULT")
        return result
    }

    /**
     * Gets the gamma function to be used for color interpolation.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_interpolation">XPS_COLOR_INTERPOLATION</a> value that describes the gamma function to be used for color interpolation.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getcolorinterpolationmode
     */
    GetColorInterpolationMode() {
        result := ComCall(15, this, "int*", &colorInterpolationMode := 0, "HRESULT")
        return colorInterpolationMode
    }

    /**
     * Sets the XPS_COLOR_INTERPOLATION value, which describes the gamma function to be used for color interpolation.
     * @param {Integer} colorInterpolationMode The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_color_interpolation">XPS_COLOR_INTERPOLATION</a> value, which describes the gamma function to be used for color interpolation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-setcolorinterpolationmode
     */
    SetColorInterpolationMode(colorInterpolationMode) {
        result := ComCall(16, this, "int", colorInterpolationMode, "HRESULT")
        return result
    }
}
