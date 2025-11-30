#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EncoderParameterValueType enumeration specifies data types for image codec (encoder/decoder) parameters. An element of this enumeration is assigned to the Type data member of an EncoderParameter object.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-encoderparametervaluetype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderParameterValueType extends Win32Enum{

    /**
     * Specifies that the parameter is an 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeByte => 1

    /**
     * Specifies that the parameter is a null-terminated character string.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeASCII => 2

    /**
     * Specifies that the parameter is a 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeShort => 3

    /**
     * Specifies that the parameter is a 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeLong => 4

    /**
     * Specifies that the parameter is an array of two, 32-bit unsigned integers. The pair of integers represents a fraction. The first integer in the pair is the numerator, and the second integer in the pair is the denominator.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeRational => 5

    /**
     * Specifies that the parameter is an array of two, 32-bit unsigned integers. The pair of integers represents a range of numbers. The first integer is the smallest number in the range, and the second integer is the largest number in the range.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeLongRange => 6

    /**
     * Specifies that the parameter is an array of bytes that can hold values of any type.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeUndefined => 7

    /**
     * Specifies that the parameter is an array of four, 32-bit unsigned integers. The first two integers represent one fraction, and the second two integers represent a second fraction. The two fractions represent a range of rational numbers. The first fraction is the smallest rational number in the range, and the second fraction is the largest rational number in the range.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeRationalRange => 8

    /**
     * Specifies that the parameter is a pointer to a block of custom metadata.
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypePointer => 9
}
