#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about joining an existing conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationjoinevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_CONVERSATIONJOINEVENT extends Win32Enum {

    /**
     * The name of the application used for joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The account name used for joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_ACCOUNTNAME
     * @type {Integer (Int32)}
     */
    static ACCOUNTNAME => 2

    /**
     * The conversation identifier used for joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_CONVID
     * @type {Integer (Int32)}
     */
    static CONVID => 3

    /**
     * The IP address of the computer joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_JOININGIP
     * @type {Integer (Int32)}
     */
    static JOININGIP => 4

    /**
     * The user name for the user who joined an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_JOININGUSER
     * @type {Integer (Int32)}
     */
    static JOININGUSER => 5

    /**
     * The reason given for joining an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 6

    /**
     * The number of members in the existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_MEMBERCOUNT
     * @type {Integer (Int32)}
     */
    static MEMBERCOUNT => 7

    /**
     * The member of the existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_MEMBER
     * @type {Integer (Int32)}
     */
    static MEMBER => 8

    /**
     * The sender who invited others to join an existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_SENDER
     * @type {Integer (Int32)}
     */
    static SENDER => 9

    /**
     * The arguments used for the existing conversation.
     * Native name: WPC_ARGS_CONVERSATIONJOINEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 10
}
