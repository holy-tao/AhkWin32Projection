#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how the spread region is to be filled.
 * @remarks
 * 
  * The following illustration shows the effect of the spread methods on gradients that are drawn by using the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomlineargradientbrush">IXpsOMLinearGradientBrush</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomradialgradientbrush">IXpsOMRadialGradientBrush</a> interfaces. The gradient region of an <b>IXpsOMLinearGradientBrush</b> interface is defined by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-setstartpoint">SetStartPoint</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-setendpoint">SetEndPoint</a> methods; the gradient region of an  <b>IXpsOMRadialGradientBrush</b> interface is defined by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setcenter">SetCenter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setgradientorigin">SetGradientOrigin</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomradialgradientbrush-setradiisizes">SetRadiiSizes</a>  methods.     The gradient region is the area inside the dashed lines, and the spread area is the area outside of the gradient region.
  * 
  * <img alt="An illustration that shows examples of the spread method" src="./images/XPS_Spread_Method.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_spread_method
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SPREAD_METHOD{

    /**
     * The spread region is filled with the color whose value equals the color  at the end of the gradient region.
     * @type {Integer (Int32)}
     */
    static XPS_SPREAD_METHOD_PAD => 1

    /**
     * The spread region is filled by repeating the alternating reflection of the gradient that is  inside the gradient region.
     * @type {Integer (Int32)}
     */
    static XPS_SPREAD_METHOD_REFLECT => 2

    /**
     * The spread region is filled by repeating the gradient that is inside the gradient region, in the same orientation and direction.
     * @type {Integer (Int32)}
     */
    static XPS_SPREAD_METHOD_REPEAT => 3
}
