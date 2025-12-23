#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechObjectToken extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTDataKey => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTCategory => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetDescription => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTSetId => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetAttribute => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTCreateInstance => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTRemove => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTGetStorageFileName => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTRemoveStorageFileName => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTIsUISupported => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTDisplayUI => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SOTMatchesAttributes => 13
}
