#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units of measure used in the 3D model.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodelunit
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DModelUnit extends Win32Enum{

    /**
     * The units of the 3D model are specified in meters.
     * @type {Integer (Int32)}
     */
    static Meter => 0

    /**
     * The units of the 3D model are specified in microns.
     * @type {Integer (Int32)}
     */
    static Micron => 1

    /**
     * The units of the 3D model are specified in millimeters.
     * @type {Integer (Int32)}
     */
    static Millimeter => 2

    /**
     * The units of the 3D model are specified in centimeters.
     * @type {Integer (Int32)}
     */
    static Centimeter => 3

    /**
     * The units of the 3D model are specified in inches.
     * @type {Integer (Int32)}
     */
    static Inch => 4

    /**
     * The units of the 3D model are specified in feet.
     * @type {Integer (Int32)}
     */
    static Foot => 5
}
