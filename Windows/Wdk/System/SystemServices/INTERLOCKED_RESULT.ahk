#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class INTERLOCKED_RESULT extends Win32Enum {

    /**
     * Native name: ResultNegative
     * @type {Integer (Int32)}
     */
    static Negative => 32768

    /**
     * Native name: ResultZero
     * @type {Integer (Int32)}
     */
    static Zero => 16384

    /**
     * Native name: ResultPositive
     * @type {Integer (Int32)}
     */
    static Positive => 0
}
