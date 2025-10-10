#Requires AutoHotkey v2.0.0 64-bit

/**
 * The structured exception codes thrown by this component. These exceptions are fatal and should not be handled by the application.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_exception_code
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_EXCEPTION_CODE{

    /**
     * This exception occurs to indicate that usage of the web services component 
 *                     has violated the API contract.
     * @type {Integer (Int32)}
     */
    static WS_EXCEPTION_CODE_USAGE_FAILURE => -1069744128

    /**
     * This exception occurs to indicate that an internal error occurred in the 
 *                     web services component.
     * @type {Integer (Int32)}
     */
    static WS_EXCEPTION_CODE_INTERNAL_FAILURE => -1069744127
}
