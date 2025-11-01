#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsOMGradientStopCollection>} gradientStops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getgradientstops
     */
    GetGradientStops(gradientStops) {
        result := ComCall(7, this, "ptr*", gradientStops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransform
     */
    GetTransform(transform) {
        result := ComCall(8, this, "ptr*", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransformlocal
     */
    GetTransformLocal(transform) {
        result := ComCall(9, this, "ptr*", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMMatrixTransform} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlocal
     */
    SetTransformLocal(transform) {
        result := ComCall(10, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-gettransformlookup
     */
    GetTransformLookup(key) {
        result := ComCall(11, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(12, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} spreadMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getspreadmethod
     */
    GetSpreadMethod(spreadMethod) {
        result := ComCall(13, this, "int*", spreadMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} spreadMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-setspreadmethod
     */
    SetSpreadMethod(spreadMethod) {
        result := ComCall(14, this, "int", spreadMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} colorInterpolationMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-getcolorinterpolationmode
     */
    GetColorInterpolationMode(colorInterpolationMode) {
        result := ComCall(15, this, "int*", colorInterpolationMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} colorInterpolationMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientbrush-setcolorinterpolationmode
     */
    SetColorInterpolationMode(colorInterpolationMode) {
        result := ComCall(16, this, "int", colorInterpolationMode, "HRESULT")
        return result
    }
}
