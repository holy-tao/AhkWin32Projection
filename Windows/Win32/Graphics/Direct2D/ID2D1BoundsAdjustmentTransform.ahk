#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * A support transform for effects to modify the output rectangle of the previous effect or bitmap.
 * @remarks
 * 
 * The support transform can be used for two different reasons.
 * 
 * <ul>
 * <li>
 * To indicate that a region of its input image is already transparent black.  The expanded area will be treated as transparent black.
 * 
 * This can increase efficiency for rendering bitmaps.
 * 
 * </li>
 * <li>
 * To increase the size of the input image.
 * 
 * </li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1boundsadjustmenttransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BoundsAdjustmentTransform extends ID2D1TransformNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BoundsAdjustmentTransform
     * @type {Guid}
     */
    static IID => Guid("{90f732e2-5092-4606-a819-8651970baccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputBounds", "GetOutputBounds"]

    /**
     * 
     * @param {Pointer<RECT>} outputBounds 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1boundsadjustmenttransform-setoutputbounds
     */
    SetOutputBounds(outputBounds) {
        ComCall(4, this, "ptr", outputBounds)
    }

    /**
     * 
     * @param {Pointer<RECT>} outputBounds 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1boundsadjustmenttransform-getoutputbounds
     */
    GetOutputBounds(outputBounds) {
        ComCall(5, this, "ptr", outputBounds)
    }
}
