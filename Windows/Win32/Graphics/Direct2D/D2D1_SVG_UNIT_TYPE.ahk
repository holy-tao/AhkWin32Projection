#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the coordinate system used for SVG gradient or clipPath elements.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_unit_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SVG_UNIT_TYPE extends Win32Enum {

    /**
     * The property is set to SVG's 'userSpaceOnUse' value.
     * Native name: D2D1_SVG_UNIT_TYPE_USER_SPACE_ON_USE
     * @type {Integer (Int32)}
     */
    static USER_SPACE_ON_USE => 0

    /**
     * The property is set to SVG's 'objectBoundingBox' value.
     * Native name: D2D1_SVG_UNIT_TYPE_OBJECT_BOUNDING_BOX
     * @type {Integer (Int32)}
     */
    static OBJECT_BOUNDING_BOX => 1
}
