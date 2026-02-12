#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the rotation operation to be performed on pixel data.
 * @remarks
 * This enumeration is used when setting the [Rotation](bitmaptransform_rotation.md) property of a [BitmapTransform](bitmaptransform.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaprotation
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapRotation extends Win32Enum{

    /**
     * No rotation operation is performed.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Perform a clockwise rotation of 90 degrees.
     * @type {Integer (Int32)}
     */
    static Clockwise90Degrees => 1

    /**
     * Perform a clockwise rotation of 180 degrees.
     * @type {Integer (Int32)}
     */
    static Clockwise180Degrees => 2

    /**
     * Perform a clockwise rotation of 270 degrees.
     * @type {Integer (Int32)}
     */
    static Clockwise270Degrees => 3
}
