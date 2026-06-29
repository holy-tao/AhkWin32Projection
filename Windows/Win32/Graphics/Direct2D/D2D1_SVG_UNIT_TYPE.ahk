#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the coordinate system used for SVG gradient or clipPath elements.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_unit_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_UNIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The property is set to SVG's 'userSpaceOnUse' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_UNIT_TYPE_USER_SPACE_ON_USE => 0

    /**
     * The property is set to SVG's 'objectBoundingBox' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_UNIT_TYPE_OBJECT_BOUNDING_BOX => 1
}
