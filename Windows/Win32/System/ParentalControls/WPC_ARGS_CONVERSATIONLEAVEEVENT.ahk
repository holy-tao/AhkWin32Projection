#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about leaving a conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationleaveevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_CONVERSATIONLEAVEEVENT extends Win32Enum {

    /**
     * The name of the application used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The account name used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_ACCOUNTNAME
     * @type {Integer (Int32)}
     */
    static ACCOUNTNAME => 2

    /**
     * The conversation identifier used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_CONVID
     * @type {Integer (Int32)}
     */
    static CONVID => 3

    /**
     * The IP address of the computer leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGIP
     * @type {Integer (Int32)}
     */
    static LEAVINGIP => 4

    /**
     * The user who is leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGUSER
     * @type {Integer (Int32)}
     */
    static LEAVINGUSER => 5

    /**
     * The reason given for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 6

    /**
     * The number of members left in the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBERCOUNT
     * @type {Integer (Int32)}
     */
    static MEMBERCOUNT => 7

    /**
     * The member who is leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBER
     * @type {Integer (Int32)}
     */
    static MEMBER => 8

    /**
     * The flags used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_FLAGS
     * @type {Integer (Int32)}
     */
    static FLAGS => 9

    /**
     * The arguments used for leaving the conversation.
     * Native name: WPC_ARGS_CONVERSATIONLEAVEEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 10
}
