#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about an email message that has been received.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_emailreceievedevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_EMAILRECEIEVEDEVENT{

    /**
     * The sender who sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_SENDER => 0

    /**
     * The name of the application that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_APPNAME => 1

    /**
     * The version of the application that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_APPVERSION => 2

    /**
     * The subject line of the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_SUBJECT => 3

    /**
     * The reason given for the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_REASON => 4

    /**
     * The number of accounts that received the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPCOUNT => 5

    /**
     * The recipient account that received the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPIENT => 6

    /**
     * The number of attachments in the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHCOUNT => 7

    /**
     * The name of the attachment in the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHMENTNAME => 8

    /**
     * The time that the email message was received.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_RECEIVEDTIME => 9

    /**
     * The email account that sent the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_EMAILACCOUNT => 10

    /**
     * The arguments for the email message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILRECEIEVEDEVENT_CARGS => 11
}
