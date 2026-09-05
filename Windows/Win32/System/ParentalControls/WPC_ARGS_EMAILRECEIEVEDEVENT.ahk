#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about an email message that has been received.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_emailreceievedevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_EMAILRECEIEVEDEVENT extends Win32Enum {

    /**
     * The sender who sent the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_SENDER
     * @type {Integer (Int32)}
     */
    static SENDER => 0

    /**
     * The name of the application that sent the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The version of the application that sent the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 2

    /**
     * The subject line of the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_SUBJECT
     * @type {Integer (Int32)}
     */
    static SUBJECT => 3

    /**
     * The reason given for the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 4

    /**
     * The number of accounts that received the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPCOUNT
     * @type {Integer (Int32)}
     */
    static RECIPCOUNT => 5

    /**
     * The recipient account that received the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_RECIPIENT
     * @type {Integer (Int32)}
     */
    static RECIPIENT => 6

    /**
     * The number of attachments in the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHCOUNT
     * @type {Integer (Int32)}
     */
    static ATTACHCOUNT => 7

    /**
     * The name of the attachment in the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_ATTACHMENTNAME
     * @type {Integer (Int32)}
     */
    static ATTACHMENTNAME => 8

    /**
     * The time that the email message was received.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_RECEIVEDTIME
     * @type {Integer (Int32)}
     */
    static RECEIVEDTIME => 9

    /**
     * The email account that sent the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_EMAILACCOUNT
     * @type {Integer (Int32)}
     */
    static EMAILACCOUNT => 10

    /**
     * The arguments for the email message.
     * Native name: WPC_ARGS_EMAILRECEIEVEDEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 11
}
