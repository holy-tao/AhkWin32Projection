#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a collection of style properties to be used by methods like ID2D1DeviceContext2::DrawInkwhen rendering ink. The ink style defines the nib (pen tip) shape and transform.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1inkstyle
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1InkStyle extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1InkStyle
     * @type {Guid}
     */
    static IID => Guid("{bae8b344-23fc-4071-8cb5-d05d6f073848}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNibTransform", "GetNibTransform", "SetNibShape", "GetNibShape"]

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1inkstyle-setnibtransform(constd2d1_matrix_3x2_f_)
     */
    SetNibTransform(transform) {
        ComCall(4, this, "ptr", transform)
    }

    /**
     * Retrieves the transform to be applied to this style's nib shape.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this method returns, contains a pointer to the transform to be applied to this style's nib shape.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1inkstyle-getnibtransform
     */
    GetNibTransform(transform) {
        ComCall(5, this, "ptr", transform)
    }

    /**
     * Sets the pre-transform nib shape for this style.
     * @param {Integer} nibShape Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape">D2D1_INK_NIB_SHAPE</a></b>
     * 
     * The pre-transform nib shape to use in this style.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1inkstyle-setnibshape
     */
    SetNibShape(nibShape) {
        ComCall(6, this, "int", nibShape)
    }

    /**
     * Retrieves the pre-transform nib shape for this style.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape">D2D1_INK_NIB_SHAPE</a></b>
     * 
     * Returns the pre-transform nib shape for this style.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1inkstyle-getnibshape
     */
    GetNibShape() {
        result := ComCall(7, this, "int")
        return result
    }
}
