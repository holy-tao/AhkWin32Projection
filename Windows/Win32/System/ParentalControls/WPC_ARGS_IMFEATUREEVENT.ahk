#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about the features of the instant messaging interaction.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_imfeatureevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_IMFEATUREEVENT{

    /**
     * The name of the application used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_APPNAME => 0

    /**
     * The version of the application used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_APPVERSION => 1

    /**
     * The account name used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_ACCOUNTNAME => 2

    /**
     * The conversation ID used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_CONVID => 3

    /**
     * The media type used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_MEDIATYPE => 4

    /**
     * The reason used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_REASON => 5

    /**
     * The number of recipients in the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_RECIPCOUNT => 6

    /**
     * The recipient of the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_RECIPIENT => 7

    /**
     * The sender of the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_SENDER => 8

    /**
     * The IP address of the sender of the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_SENDERIP => 9

    /**
     * The data used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_DATA => 10

    /**
     * The arguments used for the instant messaging interaction.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMFEATUREEVENT_CARGS => 11
}
