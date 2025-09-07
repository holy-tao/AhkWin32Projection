#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how units in Direct2D will be interpreted.
 * @remarks
 * Setting the unit mode to <b>D2D1_UNIT_MODE_PIXELS</b> is similar to setting the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> dots per inch (dpi) to 96. However, Direct2D still checks the dpi to determine the threshold for enabling vertical antialiasing for text, and when the unit mode is restored, the dpi will be remembered.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_UNIT_MODE{

    /**
     * Units will be interpreted as device-independent pixels (1/96").
     * @type {Integer (Int32)}
     */
    static D2D1_UNIT_MODE_DIPS => 0

    /**
     * Units will be interpreted as pixels.
     * @type {Integer (Int32)}
     */
    static D2D1_UNIT_MODE_PIXELS => 1
}
