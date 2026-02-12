#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the Exchangeable Image File (EXIF) orientation flag of the photo. This flag describes how to rotate the photo to display it correctly.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.photoorientation
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class PhotoOrientation extends Win32Enum{

    /**
     * An orientation flag is not set.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * No rotation needed. The photo can be displayed using its current orientation.
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Flip the photo horizontally.
     * @type {Integer (Int32)}
     */
    static FlipHorizontal => 2

    /**
     * Rotate the photo 180 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate180 => 3

    /**
     * Flip the photo vertically.
     * @type {Integer (Int32)}
     */
    static FlipVertical => 4

    /**
     * Rotate the photo counter-clockwise 270 degrees and then flip it horizontally.
     * @type {Integer (Int32)}
     */
    static Transpose => 5

    /**
     * Rotate the photo counter-clockwise 270 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate270 => 6

    /**
     * Rotate the photo counter-clockwise 90 degrees and then flip it horizontally.
     * @type {Integer (Int32)}
     */
    static Transverse => 7

    /**
     * Rotate the photo counter-clockwise 90 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate90 => 8
}
