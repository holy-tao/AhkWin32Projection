#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents an collection of D2D1_GRADIENT_STOP objects for linear and radial gradient brushes.
 * @remarks
 * 
  * <h3><a id="Creating_ID2D1GradientStopCollection_Objects"></a><a id="creating_id2d1gradientstopcollection_objects"></a><a id="CREATING_ID2D1GRADIENTSTOPCOLLECTION_OBJECTS"></a>Creating ID2D1GradientStopCollection Objects</h3>
  * To create an <b>ID2D1GradientStopCollection</b>, use the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-creategradientstopcollection(constd2d1_gradient_stop_uint32_d2d1_gamma_d2d1_extend_mode_id2d1gradientstopcollection)">ID2D1RenderTarget::CreateGradientStopCollection</a> method.  
  * 
  * A gradient stop collection is a device-dependent resource: your application should create gradient stop collections after it initializes the render target with which the gradient stop collection will be used, and recreate the gradient stop collection whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1gradientstopcollection
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GradientStopCollection extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GradientStopCollection
     * @type {Guid}
     */
    static IID => Guid("{2cd906a7-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGradientStopCount", "GetGradientStops", "GetColorInterpolationGamma", "GetExtendMode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount
     */
    GetGradientStopCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @param {Integer} gradientStopsCount 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstops
     */
    GetGradientStops(gradientStops, gradientStopsCount) {
        ComCall(5, this, "ptr", gradientStops, "uint", gradientStopsCount)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getcolorinterpolationgamma
     */
    GetColorInterpolationGamma() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getextendmode
     */
    GetExtendMode() {
        result := ComCall(7, this, "int")
        return result
    }
}
