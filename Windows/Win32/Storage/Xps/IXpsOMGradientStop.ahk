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
     * 
     * @returns {IXpsOMGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IXpsOMGradientBrush(owner)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getoffset
     */
    GetOffset() {
        result := ComCall(4, this, "float*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-setoffset
     */
    SetOffset(offset) {
        result := ComCall(5, this, "float", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @returns {IXpsOMColorProfileResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-getcolor
     */
    GetColor(color) {
        result := ComCall(6, this, "ptr", color, "ptr*", &colorProfile := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfile)
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-setcolor
     */
    SetColor(color, colorProfile) {
        result := ComCall(7, this, "ptr", color, "ptr", colorProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMGradientStop} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgradientstop-clone
     */
    Clone() {
        result := ComCall(8, this, "ptr*", &gradientStop := 0, "HRESULT")
        return IXpsOMGradientStop(gradientStop)
    }
}
