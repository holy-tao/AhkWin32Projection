#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the start of a computer game.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_gamestartevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_GAMESTARTEVENT extends Win32Enum{

    /**
     * The application identifier of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_APPID => 0

    /**
     * The instance identifier of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_INSTANCEID => 1

    /**
     * The version of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_APPVERSION => 2

    /**
     * The path of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_PATH => 3

    /**
     * The rating of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_RATING => 4

    /**
     * The rating system used to rate the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_RATINGSYSTEM => 5

    /**
     * The reason for starting the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_REASON => 6

    /**
     * The number of descriptors of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_DESCCOUNT => 7

    /**
     * The descriptor of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_DESCRIPTOR => 8

    /**
     * The product identifier of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_PID => 9

    /**
     * The arguments of the computer game.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_GAMESTARTEVENT_CARGS => 10
}
