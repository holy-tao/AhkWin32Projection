#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how one geometry object is spatially related to another geometry object.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_geometry_relation
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_GEOMETRY_RELATION extends Win32Enum{

    /**
     * The relationship between the two geometries cannot be determined. This value is never returned by any D2D method.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_RELATION_UNKNOWN => 0

    /**
     * The two geometries  do not intersect at all.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_RELATION_DISJOINT => 1

    /**
     * The instance geometry is entirely contained by  the passed-in geometry.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_RELATION_IS_CONTAINED => 2

    /**
     * The instance geometry entirely contains the passed-in geometry.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_RELATION_CONTAINS => 3

    /**
     * The two geometries overlap but neither completely contains the other.
     * @type {Integer (Int32)}
     */
    static D2D1_GEOMETRY_RELATION_OVERLAP => 4
}
