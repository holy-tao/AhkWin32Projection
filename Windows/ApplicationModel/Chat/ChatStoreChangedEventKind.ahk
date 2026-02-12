#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change that occurred for a [ChatMessageStoreChanged](chatmessagestorechangedeventargs.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatstorechangedeventkind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatStoreChangedEventKind extends Win32Enum{

    /**
     * Notifications have been missed
     * @type {Integer (Int32)}
     */
    static NotificationsMissed => 0

    /**
     * The chat store has been modified
     * @type {Integer (Int32)}
     */
    static StoreModified => 1

    /**
     * A chat message has been created
     * @type {Integer (Int32)}
     */
    static MessageCreated => 2

    /**
     * A chat message has been changed
     * @type {Integer (Int32)}
     */
    static MessageModified => 3

    /**
     * A chat message has been deleted
     * @type {Integer (Int32)}
     */
    static MessageDeleted => 4

    /**
     * A chat conversation has been modified
     * @type {Integer (Int32)}
     */
    static ConversationModified => 5

    /**
     * A chat conversation has been deleted
     * @type {Integer (Int32)}
     */
    static ConversationDeleted => 6

    /**
     * A chat conversation has been deleted of all messages from a transport.
     * @type {Integer (Int32)}
     */
    static ConversationTransportDeleted => 7
}
