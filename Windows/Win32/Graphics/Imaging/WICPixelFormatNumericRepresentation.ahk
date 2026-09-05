#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a primitive type for numeric representation of a WIC pixel format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpixelformatnumericrepresentation
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPixelFormatNumericRepresentation extends Win32Enum {

    /**
     * The format is not specified.
     * Native name: WICPixelFormatNumericRepresentationUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Specifies that the format is indexed.
     * Native name: WICPixelFormatNumericRepresentationIndexed
     * @type {Integer (Int32)}
     */
    static Indexed => 1

    /**
     * Specifies that the format is represented as an unsigned integer.
     * Native name: WICPixelFormatNumericRepresentationUnsignedInteger
     * @type {Integer (Int32)}
     */
    static UnsignedInteger => 2

    /**
     * Specifies that the format is represented as a signed integer.
     * Native name: WICPixelFormatNumericRepresentationSignedInteger
     * @type {Integer (Int32)}
     */
    static SignedInteger => 3

    /**
     * Specifies that the format is represented as a fixed-point number.
     * Native name: WICPixelFormatNumericRepresentationFixed
     * @type {Integer (Int32)}
     */
    static Fixed => 4

    /**
     * Specifies that the format is represented as a floating-point number.
     * Native name: WICPixelFormatNumericRepresentationFloat
     * @type {Integer (Int32)}
     */
    static Float => 5
}
