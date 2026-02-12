#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the message operator type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageoperatorkind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageOperatorKind extends Win32Enum{

    /**
     * The value hasn't been set.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * SMS message
     * @type {Integer (Int32)}
     */
    static Sms => 1

    /**
     * MMS message
     * @type {Integer (Int32)}
     */
    static Mms => 2

    /**
     * Rich Communication Services (RCS) message
     * @type {Integer (Int32)}
     */
    static Rcs => 3
}
