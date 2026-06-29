#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies interpolation mode, which affects how values are calculated during rasterization.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_INTERPOLATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The interpolation mode is undefined.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_UNDEFINED => 0

    /**
     * Don't interpolate between register values.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_CONSTANT => 1

    /**
     * Interpolate linearly between register values.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR => 2

    /**
     * Interpolate linearly between register values but centroid clamped when multisampling.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR_CENTROID => 3

    /**
     * Interpolate linearly between register values but with no perspective correction.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE => 4

    /**
     * Interpolate linearly between register values but with no perspective correction and centroid clamped when multisampling.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_CENTROID => 5

    /**
     * Interpolate linearly between register values but sample clamped when multisampling.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR_SAMPLE => 6

    /**
     * Interpolate linearly between register values but with no perspective correction and sample clamped when multisampling.
     * @type {Integer (Int32)}
     */
    static D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_SAMPLE => 7
}
