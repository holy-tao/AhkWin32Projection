#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class EncoderParameterValueType extends Win32Enum {

    /**
     * Native name: EncoderParameterValueTypeByte
     * @type {Integer (Int32)}
     */
    static Byte => 1

    /**
     * Native name: EncoderParameterValueTypeASCII
     * @type {Integer (Int32)}
     */
    static TypeASCII => 2

    /**
     * Native name: EncoderParameterValueTypeShort
     * @type {Integer (Int32)}
     */
    static Short => 3

    /**
     * Native name: EncoderParameterValueTypeLong
     * @type {Integer (Int32)}
     */
    static Long => 4

    /**
     * Native name: EncoderParameterValueTypeRational
     * @type {Integer (Int32)}
     */
    static Rational => 5

    /**
     * Native name: EncoderParameterValueTypeLongRange
     * @type {Integer (Int32)}
     */
    static LongRange => 6

    /**
     * Native name: EncoderParameterValueTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 7

    /**
     * Native name: EncoderParameterValueTypeRationalRange
     * @type {Integer (Int32)}
     */
    static RationalRange => 8

    /**
     * Native name: EncoderParameterValueTypePointer
     * @type {Integer (Int32)}
     */
    static Pointer => 9
}
