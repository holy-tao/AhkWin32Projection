#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about an email message that has been sent.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_args_emailsentevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_EMAILSENTEVENT{

    /**
     * The sender who sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_SENDER => 0

    /**
     * The name of the application that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_APPNAME => 1

    /**
     * The version of the application that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_APPVERSION => 2

    /**
     * The subject of the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_SUBJECT => 3

    /**
     * The reason for the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_REASON => 4

    /**
     * The number of accounts that received the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_RECIPCOUNT => 5

    /**
     * The recipient account that received the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_RECIPIENT => 6

    /**
     * The number of attachments in the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_ATTACHCOUNT => 7

    /**
     * The name of the attachment in the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_ATTACHMENTNAME => 8

    /**
     * The email account that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_EMAILACCOUNT => 9

    /**
     * The arguments for the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILSENTEVENT_CARGS => 10
}
