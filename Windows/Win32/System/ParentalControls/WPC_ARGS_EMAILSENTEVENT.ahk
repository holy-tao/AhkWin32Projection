#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about an email message that has been sent.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_emailsentevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_EMAILSENTEVENT extends Win32Enum {

    /**
     * The sender who sent the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_SENDER
     * @type {Integer (Int32)}
     */
    static SENDER => 0

    /**
     * The name of the application that sent the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The version of the application that sent the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 2

    /**
     * The subject of the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_SUBJECT
     * @type {Integer (Int32)}
     */
    static SUBJECT => 3

    /**
     * The reason for the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 4

    /**
     * The number of accounts that received the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_RECIPCOUNT
     * @type {Integer (Int32)}
     */
    static RECIPCOUNT => 5

    /**
     * The recipient account that received the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_RECIPIENT
     * @type {Integer (Int32)}
     */
    static RECIPIENT => 6

    /**
     * The number of attachments in the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_ATTACHCOUNT
     * @type {Integer (Int32)}
     */
    static ATTACHCOUNT => 7

    /**
     * The name of the attachment in the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_ATTACHMENTNAME
     * @type {Integer (Int32)}
     */
    static ATTACHMENTNAME => 8

    /**
     * The email account that sent the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_EMAILACCOUNT
     * @type {Integer (Int32)}
     */
    static EMAILACCOUNT => 9

    /**
     * The arguments for the email message.
     * Native name: WPC_ARGS_EMAILSENTEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 10
}
