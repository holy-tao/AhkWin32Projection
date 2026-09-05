#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechObjectToken extends Win32Enum {

    /**
     * Native name: DISPID_SOTId
     * @type {Integer (Int32)}
     */
    static SOTId => 1

    /**
     * Native name: DISPID_SOTDataKey
     * @type {Integer (Int32)}
     */
    static SOTDataKey => 2

    /**
     * Native name: DISPID_SOTCategory
     * @type {Integer (Int32)}
     */
    static SOTCategory => 3

    /**
     * Native name: DISPID_SOTGetDescription
     * @type {Integer (Int32)}
     */
    static SOTGetDescription => 4

    /**
     * Native name: DISPID_SOTSetId
     * @type {Integer (Int32)}
     */
    static SOTSetId => 5

    /**
     * Native name: DISPID_SOTGetAttribute
     * @type {Integer (Int32)}
     */
    static SOTGetAttribute => 6

    /**
     * Native name: DISPID_SOTCreateInstance
     * @type {Integer (Int32)}
     */
    static SOTCreateInstance => 7

    /**
     * Native name: DISPID_SOTRemove
     * @type {Integer (Int32)}
     */
    static SOTRemove => 8

    /**
     * Native name: DISPID_SOTGetStorageFileName
     * @type {Integer (Int32)}
     */
    static SOTGetStorageFileName => 9

    /**
     * Native name: DISPID_SOTRemoveStorageFileName
     * @type {Integer (Int32)}
     */
    static SOTRemoveStorageFileName => 10

    /**
     * Native name: DISPID_SOTIsUISupported
     * @type {Integer (Int32)}
     */
    static SOTIsUISupported => 11

    /**
     * Native name: DISPID_SOTDisplayUI
     * @type {Integer (Int32)}
     */
    static SOTDisplayUI => 12

    /**
     * Native name: DISPID_SOTMatchesAttributes
     * @type {Integer (Int32)}
     */
    static SOTMatchesAttributes => 13
}
