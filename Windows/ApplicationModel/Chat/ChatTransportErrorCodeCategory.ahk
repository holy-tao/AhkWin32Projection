#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the category of a transport error.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chattransporterrorcodecategory
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatTransportErrorCodeCategory extends Win32Enum{

    /**
     * No specific category for the error code
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * An HTTP error
     * @type {Integer (Int32)}
     */
    static Http => 1

    /**
     * Can't connect to the network
     * @type {Integer (Int32)}
     */
    static Network => 2

    /**
     * An MMS server error
     * @type {Integer (Int32)}
     */
    static MmsServer => 3
}
