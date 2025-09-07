#Requires AutoHotkey v2.0.0 64-bit

/**
 * A set of property values associated with the error. They are set and retrieved using WsGetErrorProperty and WsSetErrorProperty.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_error_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ERROR_PROPERTY_ID{

    /**
     * The number of error strings (ULONG) available in the error object. Error strings 
 *                     might be added using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsadderrorstring">WsAddErrorString</a>. When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE</a> is present in the error object, the corresponding error text will be counted as an
 *                     additional string in the returned number of error strings. 
 *                 
 * 
 *                     This property is read only.
     * @type {Integer (Int32)}
     */
    static WS_ERROR_PROPERTY_STRING_COUNT => 0

    /**
     * If the error returned from the function was mapped to one of the 
 *                     standard WS_E_* errors, then this property is used to store the original
 *                     implementation specific error code.
 *                 
 * 
 * Note that the original error code is specific to a particular implementation and version of the underlying libraries used by WWSAPI. It should not be 
 *                     expected to remain constant, as the libraries may change.  
 * 
 * 
 * The main purpose in exposing this error is for diagnostic purposes, as the application may
 *                     take a look at original error code of underlying library that caused this error.
 * 
 * 
 * Applications that take specific action based on the implementation
 *                     specific error code will likely be broken when the implementation changes.
 *                 
 * 
 * If the error was not mapped from an implementation specific value 
 *                     to a standard error, then this property will have the value NOERROR.                
 *                 
 * 
 * The default value is NOERROR.
     * @type {Integer (Int32)}
     */
    static WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE => 1

    /**
     * This identifies the language of any language sensitive information
 *                     in the error object.
 *                 
 * 
 * This value may not be zero.
 *                 
 * 
 * This value may only be set when the error object is first created, or
 *                     after it has been reset using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a>.
     * @type {Integer (Int32)}
     */
    static WS_ERROR_PROPERTY_LANGID => 2
}
