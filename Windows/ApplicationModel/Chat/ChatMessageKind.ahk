#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of chat message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagekind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageKind extends Win32Enum{

    /**
     * A standard chat message
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * A file transfer request
     * @type {Integer (Int32)}
     */
    static FileTransferRequest => 1

    /**
     * A non-SMS/MMS message written to the device by the app
     * @type {Integer (Int32)}
     */
    static TransportCustom => 2

    /**
     * A conversation the user joined
     * @type {Integer (Int32)}
     */
    static JoinedConversation => 3

    /**
     * A conversation the user left
     * @type {Integer (Int32)}
     */
    static LeftConversation => 4

    /**
     * A conversation that another user joined
     * @type {Integer (Int32)}
     */
    static OtherParticipantJoinedConversation => 5

    /**
     * A conversation that another user left
     * @type {Integer (Int32)}
     */
    static OtherParticipantLeftConversation => 6
}
