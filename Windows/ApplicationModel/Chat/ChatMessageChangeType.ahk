#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change made to a chat message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangetype
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChangeType extends Win32Enum{

    /**
     * Message created.
     * @type {Integer (Int32)}
     */
    static MessageCreated => 0

    /**
     * Message modified.
     * @type {Integer (Int32)}
     */
    static MessageModified => 1

    /**
     * Message deleted.
     * @type {Integer (Int32)}
     */
    static MessageDeleted => 2

    /**
     * Change tracking lost.
     * @type {Integer (Int32)}
     */
    static ChangeTrackingLost => 3
}
