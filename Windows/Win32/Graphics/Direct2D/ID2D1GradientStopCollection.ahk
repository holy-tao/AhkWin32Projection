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
     * Retrieves the number of gradient stops in the collection.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of gradient stops in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount
     */
    GetGradientStopCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Copies the gradient stops from the collection into an array of D2D1_GRADIENT_STOP structures.
     * @remarks
     * 
     * Gradient stops are copied in order of position, starting with the gradient stop with the smallest position value and progressing to the gradient stop with the largest position value.
     * 
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a>*</b>
     * 
     * A pointer to a one-dimensional array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures. When this method returns, the array contains copies of the collection's gradient stops. You must allocate the memory for this array.
     * @param {Integer} gradientStopsCount Type: <b>UINT</b>
     * 
     * A value indicating the number of gradient stops to copy. If the value is less than the number of gradient stops in the collection, the remaining gradient stops are omitted. If the value is larger than the number of gradient stops in the collection, the extra gradient stops are set to <b>NULL</b>. To obtain the number of gradient stops in the collection, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount">GetGradientStopCount</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstops
     */
    GetGradientStops(gradientStops, gradientStopsCount) {
        ComCall(5, this, "ptr", gradientStops, "uint", gradientStopsCount)
    }

    /**
     * Indicates the gamma space in which the gradient stops are interpolated.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_gamma">D2D1_GAMMA</a></b>
     * 
     * The gamma space in which the gradient stops are interpolated.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gradientstopcollection-getcolorinterpolationgamma
     */
    GetColorInterpolationGamma() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * Indicates the behavior of the gradient outside the normalized gradient range.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The behavior of the gradient outside the [0,1] normalized gradient range.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1gradientstopcollection-getextendmode
     */
    GetExtendMode() {
        result := ComCall(7, this, "int")
        return result
    }
}
