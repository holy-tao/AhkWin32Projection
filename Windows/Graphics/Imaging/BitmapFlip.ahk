#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the flip operation to be performed on pixel data.
 * @remarks
 * This enumeration is used when setting the [Flip](bitmaptransform_flip.md) property of a [BitmapTransform](bitmaptransform.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapflip
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapFlip extends Win32Enum{

    /**
     * No flip operation will be performed.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Flip the bitmap around the y axis.
     * @type {Integer (Int32)}
     */
    static Horizontal => 1

    /**
     * Flip the bitmap around the x axis.
     * @type {Integer (Int32)}
     */
    static Vertical => 2
}
