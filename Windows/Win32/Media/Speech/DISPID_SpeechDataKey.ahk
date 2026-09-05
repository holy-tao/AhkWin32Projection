#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechDataKey extends Win32Enum {

    /**
     * Native name: DISPID_SDKSetBinaryValue
     * @type {Integer (Int32)}
     */
    static SDKSetBinaryValue => 1

    /**
     * Native name: DISPID_SDKGetBinaryValue
     * @type {Integer (Int32)}
     */
    static SDKGetBinaryValue => 2

    /**
     * Native name: DISPID_SDKSetStringValue
     * @type {Integer (Int32)}
     */
    static SDKSetStringValue => 3

    /**
     * Native name: DISPID_SDKGetStringValue
     * @type {Integer (Int32)}
     */
    static SDKGetStringValue => 4

    /**
     * Native name: DISPID_SDKSetLongValue
     * @type {Integer (Int32)}
     */
    static SDKSetLongValue => 5

    /**
     * Native name: DISPID_SDKGetlongValue
     * @type {Integer (Int32)}
     */
    static SDKGetlongValue => 6

    /**
     * Native name: DISPID_SDKOpenKey
     * @type {Integer (Int32)}
     */
    static SDKOpenKey => 7

    /**
     * Native name: DISPID_SDKCreateKey
     * @type {Integer (Int32)}
     */
    static SDKCreateKey => 8

    /**
     * Native name: DISPID_SDKDeleteKey
     * @type {Integer (Int32)}
     */
    static SDKDeleteKey => 9

    /**
     * Native name: DISPID_SDKDeleteValue
     * @type {Integer (Int32)}
     */
    static SDKDeleteValue => 10

    /**
     * Native name: DISPID_SDKEnumKeys
     * @type {Integer (Int32)}
     */
    static SDKEnumKeys => 11

    /**
     * Native name: DISPID_SDKEnumValues
     * @type {Integer (Int32)}
     */
    static SDKEnumValues => 12
}
