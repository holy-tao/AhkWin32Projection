#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of the Rich Communication Services (RCS) service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsservicekind
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsServiceKind extends Win32Enum{

    /**
     * Chat service
     * @type {Integer (Int32)}
     */
    static Chat => 0

    /**
     * Group chat service
     * @type {Integer (Int32)}
     */
    static GroupChat => 1

    /**
     * File transfer service
     * @type {Integer (Int32)}
     */
    static FileTransfer => 2

    /**
     * Capability service
     * @type {Integer (Int32)}
     */
    static Capability => 3
}
