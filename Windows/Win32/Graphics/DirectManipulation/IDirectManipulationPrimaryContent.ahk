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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSnapInterval", "SetSnapPoints", "SetSnapType", "SetSnapCoordinate", "SetZoomBoundaries", "SetHorizontalAlignment", "SetVerticalAlignment", "GetInertiaEndTransform", "GetCenterPoint"]

    /**
     * 
     * @param {Integer} motion 
     * @param {Float} interval 
     * @param {Float} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapinterval
     */
    SetSnapInterval(motion, interval, offset) {
        result := ComCall(3, this, "int", motion, "float", interval, "float", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Pointer<Float>} points 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints
     */
    SetSnapPoints(motion, points, pointCount) {
        pointsMarshal := points is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "int", motion, pointsMarshal, points, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnaptype
     */
    SetSnapType(motion, type) {
        result := ComCall(5, this, "int", motion, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} motion 
     * @param {Integer} coordinate 
     * @param {Float} origin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate
     */
    SetSnapCoordinate(motion, coordinate, origin) {
        result := ComCall(6, this, "int", motion, "int", coordinate, "float", origin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} zoomMinimum 
     * @param {Float} zoomMaximum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setzoomboundaries
     */
    SetZoomBoundaries(zoomMinimum, zoomMaximum) {
        result := ComCall(7, this, "float", zoomMinimum, "float", zoomMaximum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} alignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-sethorizontalalignment
     */
    SetHorizontalAlignment(alignment) {
        result := ComCall(8, this, "int", alignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} alignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setverticalalignment
     */
    SetVerticalAlignment(alignment) {
        result := ComCall(9, this, "int", alignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pointCount 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getinertiaendtransform
     */
    GetInertiaEndTransform(pointCount) {
        result := ComCall(10, this, "float*", &matrix := 0, "uint", pointCount, "HRESULT")
        return matrix
    }

    /**
     * 
     * @param {Pointer<Float>} centerX 
     * @param {Pointer<Float>} centerY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getcenterpoint
     */
    GetCenterPoint(centerX, centerY) {
        centerXMarshal := centerX is VarRef ? "float*" : "ptr"
        centerYMarshal := centerY is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, centerXMarshal, centerX, centerYMarshal, centerY, "HRESULT")
        return result
    }
}
