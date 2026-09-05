#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The different parameter types.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_parameter_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_PARAMETER_TYPE extends Win32Enum {

    /**
     * Not an array type.
     * Native name: WS_PARAMETER_TYPE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * An array type.
     * Native name: WS_PARAMETER_TYPE_ARRAY
     * @type {Integer (Int32)}
     */
    static ARRAY => 1

    /**
     * The array count.
     * Native name: WS_PARAMETER_TYPE_ARRAY_COUNT
     * @type {Integer (Int32)}
     */
    static ARRAY_COUNT => 2

    /**
     * Parameter is a WSDL message element.
     * Native name: WS_PARAMETER_TYPE_MESSAGES
     * @type {Integer (Int32)}
     */
    static MESSAGES => 3
}
