#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Defines an object that paints an area. Interfaces that derive from ID2D1Brush describe how the area is painted.
 * @remarks
 * 
 * An <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush">ID2D1BitmapBrush</a> is a device-dependent resource: your application should create bitmap brushes after it initializes the render target with which the bitmap brush will be used, and recreate the bitmap brush whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * 
 * Brush space in Direct2D is specified differently than in XPS and Windows Presentation Foundation (WPF). In Direct2D, brush space is not relative to the object being drawn, but rather is the current coordinate system of the render target, transformed by the brush transform, if present. To paint an object as it would be painted by a WPF brush, you must translate the brush space origin to the upper-left corner of the object's bounding box, and then scale the brush space so that the base tile fills the bounding box of the object.
 * 
 * For more information about brushes, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-brushes-overview">Brushes Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1brush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Brush extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Brush
     * @type {Guid}
     */
    static IID => Guid("{2cd906a8-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOpacity", "SetTransform", "GetOpacity", "GetTransform"]

    /**
     * Sets the degree of opacity of this brush.
     * @param {Float} opacity Type: <b>FLOAT</b>
     * 
     * A value between zero and 1 that indicates the opacity of the brush. This value is a constant multiplier that linearly scales the alpha value of all pixels filled by the brush. The opacity values are clamped in the range 0–1 before they are multipled together.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1brush-setopacity
     */
    SetOpacity(opacity) {
        ComCall(4, this, "float", opacity)
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1brush-settransform
     */
    SetTransform(transform) {
        ComCall(5, this, "ptr", transform)
    }

    /**
     * Gets the degree of opacity of this brush.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A value between zero and 1 that indicates the opacity of the brush. This value is a constant multiplier that linearly scales the alpha value of all pixels filled by the brush. The opacity values are clamped in the range 0–1 before they are multipled together.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1brush-getopacity
     */
    GetOpacity() {
        result := ComCall(6, this, "float")
        return result
    }

    /**
     * Gets the transform applied to this brush.
     * @remarks
     * 
     * When the brush transform is the identity matrix, the brush appears in the same coordinate space as the render target in which it is drawn.
     * 
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The transform applied to this brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1brush-gettransform
     */
    GetTransform(transform) {
        ComCall(7, this, "ptr", transform)
    }
}
