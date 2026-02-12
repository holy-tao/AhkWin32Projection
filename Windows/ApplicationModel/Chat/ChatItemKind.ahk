#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a chat item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatitemkind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatItemKind extends Win32Enum{

    /**
     * A message
     * @type {Integer (Int32)}
     */
    static Message => 0

    /**
     * A conversation
     * @type {Integer (Int32)}
     */
    static Conversation => 1
}
