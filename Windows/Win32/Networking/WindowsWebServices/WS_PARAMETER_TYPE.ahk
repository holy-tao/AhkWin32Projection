#Requires AutoHotkey v2.0.0 64-bit

/**
 * The different parameter types.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_parameter_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_PARAMETER_TYPE{

    /**
     * Not an array type.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_NORMAL => 0

    /**
     * An array type.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_ARRAY => 1

    /**
     * The array count.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_ARRAY_COUNT => 2

    /**
     * Parameter is a WSDL message element.
     * @type {Integer (Int32)}
     */
    static WS_PARAMETER_TYPE_MESSAGES => 3
}
