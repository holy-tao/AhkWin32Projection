#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about joining an existing conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationjoinevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_CONVERSATIONJOINEVENT extends Win32Enum{

    /**
     * The name of the application used for joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_APPNAME => 0

    /**
     * The version of the application used for joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_APPVERSION => 1

    /**
     * The account name used for joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_ACCOUNTNAME => 2

    /**
     * The conversation identifier used for joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_CONVID => 3

    /**
     * The IP address of the computer joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_JOININGIP => 4

    /**
     * The user name for the user who joined an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_JOININGUSER => 5

    /**
     * The reason given for joining an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_REASON => 6

    /**
     * The number of members in the existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_MEMBERCOUNT => 7

    /**
     * The member of the existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_MEMBER => 8

    /**
     * The sender who invited others to join an existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_SENDER => 9

    /**
     * The arguments used for the existing conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONJOINEVENT_CARGS => 10
}
