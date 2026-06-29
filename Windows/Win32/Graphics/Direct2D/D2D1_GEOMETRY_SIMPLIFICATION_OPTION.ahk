#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how a geometry is simplified to an ID2D1SimplifiedGeometrySink.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_geometry_simplification_option
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_GEOMETRY_SIMPLIFICATION_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
