#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PathPointType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeLine => 1

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier => 3

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypePathTypeMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeDashMode => 16

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypePathMarker => 32

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeCloseSubpath => 128

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier3 => 3
}
