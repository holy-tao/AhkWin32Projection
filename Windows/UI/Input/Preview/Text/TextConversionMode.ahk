#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextConversionMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static AlphanumericHalfWidth => 1

    /**
     * @type {Integer (Int32)}
     */
    static AlphanumericFullWidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static NativeHalfWidth => 3

    /**
     * @type {Integer (Int32)}
     */
    static NativeFullWidth => 4

    /**
     * @type {Integer (Int32)}
     */
    static KatakanaHalfWidth => 5

    /**
     * @type {Integer (Int32)}
     */
    static KatakanaFullWidth => 6

    /**
     * @type {Integer (Int32)}
     */
    static NativeHalfWidthNativeSymbol => 7

    /**
     * @type {Integer (Int32)}
     */
    static NativeFullWidthNativeSymbol => 8

    /**
     * @type {Integer (Int32)}
     */
    static NoConversion => 9

    /**
     * @type {Integer (Int32)}
     */
    static RequestConversion => 10

    /**
     * @type {Integer (Int32)}
     */
    static NativeEudc => 11
}
