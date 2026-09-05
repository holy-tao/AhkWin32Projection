#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the start of a computer game.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_gamestartevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_GAMESTARTEVENT extends Win32Enum {

    /**
     * The application identifier of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_APPID
     * @type {Integer (Int32)}
     */
    static APPID => 0

    /**
     * The instance identifier of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_INSTANCEID
     * @type {Integer (Int32)}
     */
    static INSTANCEID => 1

    /**
     * The version of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 2

    /**
     * The path of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 3

    /**
     * The rating of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_RATING
     * @type {Integer (Int32)}
     */
    static RATING => 4

    /**
     * The rating system used to rate the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_RATINGSYSTEM
     * @type {Integer (Int32)}
     */
    static RATINGSYSTEM => 5

    /**
     * The reason for starting the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 6

    /**
     * The number of descriptors of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_DESCCOUNT
     * @type {Integer (Int32)}
     */
    static DESCCOUNT => 7

    /**
     * The descriptor of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static DESCRIPTOR => 8

    /**
     * The product identifier of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_PID
     * @type {Integer (Int32)}
     */
    static PID => 9

    /**
     * The arguments of the computer game.
     * Native name: WPC_ARGS_GAMESTARTEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 10
}
