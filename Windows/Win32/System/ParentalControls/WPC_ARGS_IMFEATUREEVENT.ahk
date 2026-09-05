#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the features of the instant messaging interaction.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_imfeatureevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_IMFEATUREEVENT extends Win32Enum {

    /**
     * The name of the application used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The account name used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_ACCOUNTNAME
     * @type {Integer (Int32)}
     */
    static ACCOUNTNAME => 2

    /**
     * The conversation ID used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_CONVID
     * @type {Integer (Int32)}
     */
    static CONVID => 3

    /**
     * The media type used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_MEDIATYPE
     * @type {Integer (Int32)}
     */
    static MEDIATYPE => 4

    /**
     * The reason used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 5

    /**
     * The number of recipients in the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_RECIPCOUNT
     * @type {Integer (Int32)}
     */
    static RECIPCOUNT => 6

    /**
     * The recipient of the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_RECIPIENT
     * @type {Integer (Int32)}
     */
    static RECIPIENT => 7

    /**
     * The sender of the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_SENDER
     * @type {Integer (Int32)}
     */
    static SENDER => 8

    /**
     * The IP address of the sender of the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_SENDERIP
     * @type {Integer (Int32)}
     */
    static SENDERIP => 9

    /**
     * The data used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 10

    /**
     * The arguments used for the instant messaging interaction.
     * Native name: WPC_ARGS_IMFEATUREEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 11
}
