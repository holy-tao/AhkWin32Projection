#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 */
class KEY_VALUE_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: KeyValueBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: KeyValueFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 1

    /**
     * Native name: KeyValuePartialInformation
     * @type {Integer (Int32)}
     */
    static PartialInformation => 2

    /**
     * Native name: KeyValueFullInformationAlign64
     * @type {Integer (Int32)}
     */
    static FullInformationAlign64 => 3

    /**
     * Native name: KeyValuePartialInformationAlign64
     * @type {Integer (Int32)}
     */
    static PartialInformationAlign64 => 4

    /**
     * Native name: KeyValueLayerInformation
     * @type {Integer (Int32)}
     */
    static LayerInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyValueInfoClass => 6
}
