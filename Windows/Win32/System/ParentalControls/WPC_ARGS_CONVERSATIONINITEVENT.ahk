#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about initiating a conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationinitevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_CONVERSATIONINITEVENT{

    /**
     * The name of the application used for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_APPNAME => 0

    /**
     * The version of the application used for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_APPVERSION => 1

    /**
     * The account name used for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_ACCOUNTNAME => 2

    /**
     * The conversation identifier used for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_CONVID => 3

    /**
     * The IP address of the computer starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_REQUESTINGIP => 4

    /**
     * The sender who is starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_SENDER => 5

    /**
     * The reason given for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_REASON => 6

    /**
     * The number of recipients included in starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_RECIPCOUNT => 7

    /**
     * The recipient of the started conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_RECIPIENT => 8

    /**
     * The arguments used for starting the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONINITEVENT_CARGS => 9
}
