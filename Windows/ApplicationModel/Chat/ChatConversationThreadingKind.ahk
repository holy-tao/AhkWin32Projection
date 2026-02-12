#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how a conversation is threaded.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationthreadingkind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatConversationThreadingKind extends Win32Enum{

    /**
     * By participants
     * @type {Integer (Int32)}
     */
    static Participants => 0

    /**
     * By contact ID
     * @type {Integer (Int32)}
     */
    static ContactId => 1

    /**
     * By conversation ID
     * @type {Integer (Int32)}
     */
    static ConversationId => 2

    /**
     * Custom threading defined by the app
     * @type {Integer (Int32)}
     */
    static Custom => 3
}
