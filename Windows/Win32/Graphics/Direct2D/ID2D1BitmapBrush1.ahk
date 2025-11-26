#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1BitmapBrush.ahk

/**
 * Paints an area with a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1bitmapbrush1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BitmapBrush1 extends ID2D1BitmapBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BitmapBrush1
     * @type {Guid}
     */
    static IID => Guid("{41343a53-e41a-49a2-91cd-21793bbb62e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInterpolationMode1", "GetInterpolationMode1"]

    /**
     * Sets the interpolation mode for the brush.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The mode to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1bitmapbrush1-setinterpolationmode1
     */
    SetInterpolationMode1(interpolationMode) {
        ComCall(16, this, "int", interpolationMode)
    }

    /**
     * Returns the current interpolation mode of the brush.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The current interpolation mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1bitmapbrush1-getinterpolationmode1
     */
    GetInterpolationMode1() {
        result := ComCall(17, this, "int")
        return result
    }
}
