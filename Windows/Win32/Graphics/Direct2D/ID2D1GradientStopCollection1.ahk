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
     * 
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops 
     * @param {Integer} gradientStopsCount 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getgradientstops1
     */
    GetGradientStops1(gradientStops, gradientStopsCount) {
        ComCall(8, this, "ptr", gradientStops, "uint", gradientStopsCount)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpreinterpolationspace
     */
    GetPreInterpolationSpace() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpostinterpolationspace
     */
    GetPostInterpolationSpace() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getbufferprecision
     */
    GetBufferPrecision() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getcolorinterpolationmode
     */
    GetColorInterpolationMode() {
        result := ComCall(12, this, "int")
        return result
    }
}
