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
     * 
     * @returns {XPS_POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getcenter
     */
    GetCenter() {
        center := XPS_POINT()
        result := ComCall(17, this, "ptr", center, "HRESULT")
        return center
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} center 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setcenter
     */
    SetCenter(center) {
        result := ComCall(18, this, "ptr", center, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getradiisizes
     */
    GetRadiiSizes() {
        radiiSizes := XPS_SIZE()
        result := ComCall(19, this, "ptr", radiiSizes, "HRESULT")
        return radiiSizes
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} radiiSizes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setradiisizes
     */
    SetRadiiSizes(radiiSizes) {
        result := ComCall(20, this, "ptr", radiiSizes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-getgradientorigin
     */
    GetGradientOrigin() {
        origin := XPS_POINT()
        result := ComCall(21, this, "ptr", origin, "HRESULT")
        return origin
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} origin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setgradientorigin
     */
    SetGradientOrigin(origin) {
        result := ComCall(22, this, "ptr", origin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMRadialGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return IXpsOMRadialGradientBrush(radialGradientBrush)
    }
}
