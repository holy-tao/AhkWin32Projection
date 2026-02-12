#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies an interpretation for the error code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chattransportinterpretederrorcode
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatTransportInterpretedErrorCode extends Win32Enum{

    /**
     * There was no error.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * There is no interpretation for the error code.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * An invalid recipient address
     * @type {Integer (Int32)}
     */
    static InvalidRecipientAddress => 2

    /**
     * A network connectivity error
     * @type {Integer (Int32)}
     */
    static NetworkConnectivity => 3

    /**
     * A service denied error
     * @type {Integer (Int32)}
     */
    static ServiceDenied => 4

    /**
     * A timeout error
     * @type {Integer (Int32)}
     */
    static Timeout => 5
}
