#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSRTL_COMPARISON_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LessThan => -1

    /**
     * @type {Integer (Int32)}
     */
    static EqualTo => 0

    /**
     * @type {Integer (Int32)}
     */
    static GreaterThan => 1
}
