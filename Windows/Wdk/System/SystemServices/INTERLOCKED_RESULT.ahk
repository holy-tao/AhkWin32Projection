#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class INTERLOCKED_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ResultNegative => 32768

    /**
     * @type {Integer (Int32)}
     */
    static ResultZero => 16384

    /**
     * @type {Integer (Int32)}
     */
    static ResultPositive => 0
}
