#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the origin of the source message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessageorigin
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameChatMessageOrigin extends Win32Enum{

    /**
     * The message was transcribed through speech-to-text.
     * @type {Integer (Int32)}
     */
    static Voice => 0

    /**
     * The message was a typed text message.
     * @type {Integer (Int32)}
     */
    static Text => 1
}
