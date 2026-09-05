#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IntrinsicKind extends Win32Enum {

    /**
     * Native name: IntrinsicVoid
     * @type {Integer (Int32)}
     */
    static Void => 0

    /**
     * Native name: IntrinsicBool
     * @type {Integer (Int32)}
     */
    static Bool => 1

    /**
     * Native name: IntrinsicChar
     * @type {Integer (Int32)}
     */
    static Char => 2

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicWChar => 3

    /**
     * Native name: IntrinsicInt
     * @type {Integer (Int32)}
     */
    static Int => 4

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicUInt => 5

    /**
     * Native name: IntrinsicLong
     * @type {Integer (Int32)}
     */
    static Long => 6

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicULong => 7

    /**
     * Native name: IntrinsicFloat
     * @type {Integer (Int32)}
     */
    static Float => 8

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicHRESULT => 9

    /**
     * Native name: IntrinsicChar16
     * @type {Integer (Int32)}
     */
    static Char16 => 10

    /**
     * Native name: IntrinsicChar32
     * @type {Integer (Int32)}
     */
    static Char32 => 11
}
