#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enum is used to specify whether a header is expected to appear more than once in a message.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_repeating_header_option
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_REPEATING_HEADER_OPTION extends Win32Enum{

    /**
     * The header may appear more than once in the message.
     * @type {Integer (Int32)}
     */
    static WS_REPEATING_HEADER => 1

    /**
     * The header may appear at most once in the message.
     *                     When this option is specified, the function 
     *                     ensures that the specified header appears
     *                     at most once in the message.
     * @type {Integer (Int32)}
     */
    static WS_SINGLETON_HEADER => 2
}
