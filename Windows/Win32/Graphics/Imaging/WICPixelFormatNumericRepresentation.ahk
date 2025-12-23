#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a primitive type for numeric representation of a WIC pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPixelFormatNumericRepresentation extends Win32Enum{

    /**
     * The format is not specified.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationUnspecified => 0

    /**
     * Specifies that the format is indexed.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationIndexed => 1

    /**
     * Specifies that the format is represented as an unsigned integer.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationUnsignedInteger => 2

    /**
     * Specifies that the format is represented as a signed integer.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationSignedInteger => 3

    /**
     * Specifies that the format is represented as a fixed-point number.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationFixed => 4

    /**
     * Specifies that the format is represented as a floating-point number.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatNumericRepresentationFloat => 5
}
