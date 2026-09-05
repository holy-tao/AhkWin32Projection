#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about initiating a conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationinitevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_CONVERSATIONINITEVENT extends Win32Enum {

    /**
     * The name of the application used for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The account name used for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_ACCOUNTNAME
     * @type {Integer (Int32)}
     */
    static ACCOUNTNAME => 2

    /**
     * The conversation identifier used for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_CONVID
     * @type {Integer (Int32)}
     */
    static CONVID => 3

    /**
     * The IP address of the computer starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_REQUESTINGIP
     * @type {Integer (Int32)}
     */
    static REQUESTINGIP => 4

    /**
     * The sender who is starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_SENDER
     * @type {Integer (Int32)}
     */
    static SENDER => 5

    /**
     * The reason given for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 6

    /**
     * The number of recipients included in starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_RECIPCOUNT
     * @type {Integer (Int32)}
     */
    static RECIPCOUNT => 7

    /**
     * The recipient of the started conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_RECIPIENT
     * @type {Integer (Int32)}
     */
    static RECIPIENT => 8

    /**
     * The arguments used for starting the conversation.
     * Native name: WPC_ARGS_CONVERSATIONINITEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 9
}
