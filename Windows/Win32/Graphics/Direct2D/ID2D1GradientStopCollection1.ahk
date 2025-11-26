#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1GradientStopCollection.ahk

/**
 * Represents a collection of D2D1_GRADIENT_STOP objects for linear and radial gradient brushes. It provides get methods for all the new parameters added to the gradient stop collection.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1gradientstopcollection1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GradientStopCollection1 extends ID2D1GradientStopCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GradientStopCollection1
     * @type {Guid}
     */
    static IID => Guid("{ae1572f4-5dd0-4777-998b-9279472ae63b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGradientStops1", "GetPreInterpolationSpace", "GetPostInterpolationSpace", "GetBufferPrecision", "GetColorInterpolationMode"]

    /**
     * Copies the gradient stops from the collection into memory.
     * @remarks
     * 
     * If the [ID2D1DeviceContext::CreateGradientStopCollection](./nf-d2d1_1-id2d1devicecontext-creategradientstopcollection.md), this method returns the same values specified in the creation method. If the <b>ID2D1GradientStopCollection1</b> object was created using <b>ID2D1RenderTarget::CreateGradientStopCollection</b>, the stops returned here will first be transformed into the gamma space specified by the <i>colorInterpolationGamma</i> parameter. See the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-creategradientstopcollection">ID2D1DeviceContext::CreateGradientStopCollection</a>  method for more info about color space and gamma space.
     * 
     * If <i>gradientStopsCount</i> is less than the number of gradient stops in the collection, the remaining gradient stops are omitted. If <i>gradientStopsCount</i> is larger than the number of gradient stops in the collection, the extra gradient stops are set to <b>NULL</b>. To obtain the number of gradient stops in the collection, use the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount">GetGradientStopCount</a> method.
     * 
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a>*</b>
     * 
     * When this method returns, contains a pointer to a one-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures.
     * @param {Integer} gradientStopsCount Type: <b>UINT</b>
     * 
     * The number of gradient stops to copy.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getgradientstops1
     */
    GetGradientStops1(gradientStops, gradientStopsCount) {
        ComCall(8, this, "ptr", gradientStops, "uint", gradientStopsCount)
    }

    /**
     * Gets the color space of the input colors as well as the space in which gradient stops are interpolated.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpreinterpolationspace
     */
    GetPreInterpolationSpace() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Gets the color space after interpolation has occurred.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpostinterpolationspace
     */
    GetPostInterpolationSpace() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Gets the precision of the gradient buffer.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The buffer precision of the gradient buffer.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getbufferprecision
     */
    GetBufferPrecision() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * Retrieves the color interpolation mode that the gradient stop collection uses.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode">D2D1_COLOR_INTERPOLATION_MODE</a></b>
     * 
     * The color interpolation mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getcolorinterpolationmode
     */
    GetColorInterpolationMode() {
        result := ComCall(12, this, "int")
        return result
    }
}
