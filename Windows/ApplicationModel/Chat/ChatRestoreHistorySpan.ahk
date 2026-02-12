#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the chat restore history span.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrestorehistoryspan
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatRestoreHistorySpan extends Win32Enum{

    /**
     * Only messages from last month will be restored.
     * @type {Integer (Int32)}
     */
    static LastMonth => 0

    /**
     * Only messages from last year will be restored.
     * @type {Integer (Int32)}
     */
    static LastYear => 1

    /**
     * All messages will be restored.
     * @type {Integer (Int32)}
     */
    static AnyTime => 2
}
