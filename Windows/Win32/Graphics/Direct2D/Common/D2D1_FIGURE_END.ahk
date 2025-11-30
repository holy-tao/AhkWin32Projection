#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a specific ID2D1SimplifiedGeometrySink figure is open or closed.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_figure_end
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_FIGURE_END extends Win32Enum{

    /**
     * The figure is open.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_END_OPEN => 0

    /**
     * The figure is closed.
     * @type {Integer (Int32)}
     */
    static D2D1_FIGURE_END_CLOSED => 1
}
