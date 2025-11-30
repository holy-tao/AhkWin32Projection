#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KEY_VALUE_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueFullInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyValuePartialInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueFullInformationAlign64 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyValuePartialInformationAlign64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyValueLayerInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyValueInfoClass => 6
}
