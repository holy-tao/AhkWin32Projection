#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_WEBSITEVISITEVENT extends Win32Enum {

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_URL
     * @type {Integer (Int32)}
     */
    static URL => 0

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_DECISION
     * @type {Integer (Int32)}
     */
    static DECISION => 1

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_CATEGORIES
     * @type {Integer (Int32)}
     */
    static CATEGORIES => 2

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_BLOCKEDCATEGORIES
     * @type {Integer (Int32)}
     */
    static BLOCKEDCATEGORIES => 3

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_SERIALIZEDAPPLICATION
     * @type {Integer (Int32)}
     */
    static SERIALIZEDAPPLICATION => 4

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 5

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_CONTENTTYPE
     * @type {Integer (Int32)}
     */
    static CONTENTTYPE => 6

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_REFERRER
     * @type {Integer (Int32)}
     */
    static REFERRER => 7

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_TELEMETRY
     * @type {Integer (Int32)}
     */
    static TELEMETRY => 8

    /**
     * Native name: WPC_ARGS_WEBSITEVISITEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 9
}
