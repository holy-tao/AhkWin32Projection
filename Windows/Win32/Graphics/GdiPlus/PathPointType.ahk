#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PathPointType extends Win32Enum {

    /**
     * Native name: PathPointTypeStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: PathPointTypeLine
     * @type {Integer (Int32)}
     */
    static Line => 1

    /**
     * Native name: PathPointTypeBezier
     * @type {Integer (Int32)}
     */
    static Bezier => 3

    /**
     * Native name: PathPointTypePathTypeMask
     * @type {Integer (Int32)}
     */
    static PathTypeMask => 7

    /**
     * Native name: PathPointTypeDashMode
     * @type {Integer (Int32)}
     */
    static DashMode => 16

    /**
     * Native name: PathPointTypePathMarker
     * @type {Integer (Int32)}
     */
    static PathMarker => 32

    /**
     * Native name: PathPointTypeCloseSubpath
     * @type {Integer (Int32)}
     */
    static CloseSubpath => 128

    /**
     * Native name: PathPointTypeBezier3
     * @type {Integer (Int32)}
     */
    static Bezier3 => 3
}
