#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a geometry is simplified to an ID2D1SimplifiedGeometrySink.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_geometry_simplification_option
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_GEOMETRY_SIMPLIFICATION_OPTION{

    /**
     * The output can contain cubic Bezier curves and line segments.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES => 0

    /**
     * The output is flattened so that it contains only line segments.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES => 1
}
