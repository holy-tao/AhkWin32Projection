#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class USpoofChecks extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_SINGLE_SCRIPT_CONFUSABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MIXED_SCRIPT_CONFUSABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_WHOLE_SCRIPT_CONFUSABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_CONFUSABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_RESTRICTION_LEVEL => 16

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_INVISIBLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_CHAR_LIMIT => 64

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MIXED_NUMBERS => 128

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_HIDDEN_OVERLAY => 256

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_ALL_CHECKS => 65535

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_AUX_INFO => 1073741824
}
