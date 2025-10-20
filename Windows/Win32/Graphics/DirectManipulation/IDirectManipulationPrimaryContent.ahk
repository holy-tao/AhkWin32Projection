#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates the primary content inside a viewport.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationprimarycontent
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationPrimaryContent extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationPrimaryContent
     * @type {Guid}
     */
    static IID => Guid("{c12851e4-1698-4625-b9b1-7ca3ec18630b}")

    /**
     * The class identifier for DirectManipulationPrimaryContent
     * @type {Guid}
     */
    static CLSID => Guid("{caa02661-d59e-41c7-8393-3ba3bacb6b57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} motion 
     * @param {Float} interval 
     * @param {Float} offset 
     * @returns {HRESULT} 
     */
    SetSnapInterval(motion, interval, offset) {
        result := ComCall(3, this, "int", motion, "float", interval, "float", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Pointer<Single>} points 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    SetSnapPoints(motion, points, pointCount) {
        result := ComCall(4, this, "int", motion, "float*", points, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    SetSnapType(motion, type) {
        result := ComCall(5, this, "int", motion, "int", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Integer} coordinate 
     * @param {Float} origin 
     * @returns {HRESULT} 
     */
    SetSnapCoordinate(motion, coordinate, origin) {
        result := ComCall(6, this, "int", motion, "int", coordinate, "float", origin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} zoomMinimum 
     * @param {Float} zoomMaximum 
     * @returns {HRESULT} 
     */
    SetZoomBoundaries(zoomMinimum, zoomMaximum) {
        result := ComCall(7, this, "float", zoomMinimum, "float", zoomMaximum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} alignment 
     * @returns {HRESULT} 
     */
    SetHorizontalAlignment(alignment) {
        result := ComCall(8, this, "int", alignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} alignment 
     * @returns {HRESULT} 
     */
    SetVerticalAlignment(alignment) {
        result := ComCall(9, this, "int", alignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    GetInertiaEndTransform(matrix, pointCount) {
        result := ComCall(10, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} centerX 
     * @param {Pointer<Single>} centerY 
     * @returns {HRESULT} 
     */
    GetCenterPoint(centerX, centerY) {
        result := ComCall(11, this, "float*", centerX, "float*", centerY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
