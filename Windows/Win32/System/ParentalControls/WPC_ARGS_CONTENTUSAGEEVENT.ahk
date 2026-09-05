#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_CONTENTUSAGEEVENT extends Win32Enum {

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID
     * @type {Integer (Int32)}
     */
    static CONTENTPROVIDERID => 0

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE
     * @type {Integer (Int32)}
     */
    static CONTENTPROVIDERTITLE => 1

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_ID
     * @type {Integer (Int32)}
     */
    static ID => 2

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 3

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY
     * @type {Integer (Int32)}
     */
    static CATEGORY => 4

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_RATINGS
     * @type {Integer (Int32)}
     */
    static RATINGS => 5

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_DECISION
     * @type {Integer (Int32)}
     */
    static DECISION => 6

    /**
     * Native name: WPC_ARGS_CONTENTUSAGEEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 7
}
