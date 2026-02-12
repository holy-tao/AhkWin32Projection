#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of the message transport.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportkind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageTransportKind extends Win32Enum{

    /**
     * Text message
     * @type {Integer (Int32)}
     */
    static Text => 0

    /**
     * Untriaged message
     * @type {Integer (Int32)}
     */
    static Untriaged => 1

    /**
     * Intercepted by the filtering app and marked as blocked
     * @type {Integer (Int32)}
     */
    static Blocked => 2

    /**
     * Custom message
     * @type {Integer (Int32)}
     */
    static Custom => 3
}
