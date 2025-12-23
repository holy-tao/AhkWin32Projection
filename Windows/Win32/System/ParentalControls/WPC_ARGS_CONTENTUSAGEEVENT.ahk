#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_CONTENTUSAGEEVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CONTENTPROVIDERTITLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_ID => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_TITLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CATEGORY => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_RATINGS => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_DECISION => 6

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONTENTUSAGEEVENT_CARGS => 7
}
