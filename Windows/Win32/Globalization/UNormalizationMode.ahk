#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNormalizationMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NFD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NFKD => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NFC => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_DEFAULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NFKC => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_FCD => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_MODE_COUNT => 7
}
