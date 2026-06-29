#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about leaving a conversation.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_conversationleaveevent
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_CONVERSATIONLEAVEEVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The name of the application used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_APPNAME => 0

    /**
     * The version of the application used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_APPVERSION => 1

    /**
     * The account name used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_ACCOUNTNAME => 2

    /**
     * The conversation identifier used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_CONVID => 3

    /**
     * The IP address of the computer leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGIP => 4

    /**
     * The user who is leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_LEAVINGUSER => 5

    /**
     * The reason given for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_REASON => 6

    /**
     * The number of members left in the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBERCOUNT => 7

    /**
     * The member who is leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_MEMBER => 8

    /**
     * The flags used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_FLAGS => 9

    /**
     * The arguments used for leaving the conversation.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_CONVERSATIONLEAVEEVENT_CARGS => 10
}
