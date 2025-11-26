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
     * Specifies snap points for the inertia end position at uniform intervals.
     * @param {Integer} motion One of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values.
     * @param {Float} interval The interval between each snap point.
     * @param {Float} offset The offset from the coordinate specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate">SetSnapCoordinate</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapinterval
     */
    SetSnapInterval(motion, interval, offset) {
        result := ComCall(3, this, "int", motion, "float", interval, "float", offset, "HRESULT")
        return result
    }

    /**
     * Specifies the snap points for the inertia rest position.
     * @param {Integer} motion One or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values. Only <b>DIRECTMANIPULATION_MOTION_TRANSLATE_X</b>, <b>DIRECTMANIPULATION_MOTION_TRANSLATE_Y</b>, or <b>DIRECTMANIPULATION_MOTION_ZOOM</b> are allowed.
     * @param {Pointer<Float>} points An array of snap points within the boundaries of the content to snap to. Should be specified in increasing order relative to the origin set in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate">SetSnapCoordinate</a>.
     * @param {Integer} pointCount The size of the array of snap points. Should be greater than 0.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. If there is no change in the snap points, this method can return <b>S_FALSE</b>. Otherwise, it returns an <b>HRESULT</b> error code. If invalid snap points are specified, existing snap points might be affected.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints
     */
    SetSnapPoints(motion, points, pointCount) {
        pointsMarshal := points is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "int", motion, pointsMarshal, points, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Specifies the type of snap point.
     * @param {Integer} motion One or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values.
     * @param {Integer} type One of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_type">DIRECTMANIPULATION_SNAPPOINT_TYPE</a> enumeration values.
     * 
     * If set to <b>DIRECTMANIPULATION_SNAPPOINT_TYPE_NONE</b>, snap points specified through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints">SetSnapPoints</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapinterval">SetSnapInterval</a> are cleared.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnaptype
     */
    SetSnapType(motion, type) {
        result := ComCall(5, this, "int", motion, "int", type, "HRESULT")
        return result
    }

    /**
     * Specifies the coordinate system for snap points or snap intervals.
     * @param {Integer} motion One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a>.
     * @param {Integer} coordinate One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a>. 
     * 
     * If <i>motion</i> is set to translation (<b>DIRECTMANIPULATION_MOTION_TRANSLATEX</b> or <b>DIRECTMANIPULATION_MOTION_TRANSLATEY</b>), all values of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a> are valid. 
     * 
     * If <i>motion</i> is set to <b>DIRECTMANIPULATION_MOTION_ZOOM</b>, only <b>DIRECTMANIPULATION_COORDINATE_ORIGIN</b> of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a> is valid (<i>origin</i> must be set to 0.0f).
     * @param {Float} origin The initial, or starting, snap point. All snap points are relative to this one. Only used when  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_COORDINATE_ORIGIN</a> is set. 
     * 
     * If <i>motion</i> is set to <b>DIRECTMANIPULATION_MOTION_ZOOM</b>, then <i>origin</i> must be set to 0.0f.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate
     */
    SetSnapCoordinate(motion, coordinate, origin) {
        result := ComCall(6, this, "int", motion, "int", coordinate, "float", origin, "HRESULT")
        return result
    }

    /**
     * Specifies the minimum and maximum boundaries for zoom.
     * @param {Float} zoomMinimum The minimum zoom level allowed. Must be greater than or equal to 0.1f, which corresponds to 100% zoom.
     * @param {Float} zoomMaximum The maximum zoom allowed. Must be greater than <i>zoomMinimum</i> and less than <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setzoomboundaries
     */
    SetZoomBoundaries(zoomMinimum, zoomMaximum) {
        result := ComCall(7, this, "float", zoomMinimum, "float", zoomMaximum, "HRESULT")
        return result
    }

    /**
     * Sets the horizontal alignment of the primary content relative to the viewport.
     * @param {Integer} alignment One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_horizontalalignment">DIRECTMANIPULATION_HORIZONTALALIGNMENT</a>. The default is <b>DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE</b>.
     * 
     * <div class="alert"><b>Note</b>  You cannot combine the following options: DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT, DIRECTMANIPULATION-HORIZONTALALIGNMENT_CENTER, DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT. DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER can be combined with any option but cannot be configured by itself.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-sethorizontalalignment
     */
    SetHorizontalAlignment(alignment) {
        result := ComCall(8, this, "int", alignment, "HRESULT")
        return result
    }

    /**
     * Specifies the vertical alignment of the primary content in the viewport.
     * @param {Integer} alignment One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_verticalalignment">DIRECTMANIPULATION_VERTICALALIGNMENT</a>.
     * 
     * <div class="alert"><b>Note</b>  You cannot combine <b>DIRECTMANIPULATION_VERTICALALIGNMENT_TOP</b>, <b>DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER</b>, or <b>DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM</b>. <b>DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER</b> can be combined with any option but cannot be configured by itself.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setverticalalignment
     */
    SetVerticalAlignment(alignment) {
        result := ComCall(9, this, "int", alignment, "HRESULT")
        return result
    }

    /**
     * Gets the final transform, including inertia, of the primary content.
     * @param {Integer} pointCount The size of the matrix. 
     * 
     *  This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} The transformed matrix that represents the inertia ending position.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getinertiaendtransform
     */
    GetInertiaEndTransform(pointCount) {
        result := ComCall(10, this, "float*", &matrix := 0, "uint", pointCount, "HRESULT")
        return matrix
    }

    /**
     * Retrieves the center point of the manipulation in content coordinates.
     * @param {Pointer<Float>} centerX The center on the horizontal axis.
     * @param {Pointer<Float>} centerY The center on the vertical axis.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getcenterpoint
     */
    GetCenterPoint(centerX, centerY) {
        centerXMarshal := centerX is VarRef ? "float*" : "ptr"
        centerYMarshal := centerY is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, centerXMarshal, centerX, centerYMarshal, centerY, "HRESULT")
        return result
    }
}
