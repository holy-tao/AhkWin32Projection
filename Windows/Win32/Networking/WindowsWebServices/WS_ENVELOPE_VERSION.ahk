#Requires AutoHotkey v2.0.0 64-bit

/**
 * The version of the specification used for the envelope structure.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_envelope_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENVELOPE_VERSION{

    /**
     * The XML namespace for this version is: 'http://schemas.xmlsoap.org/soap/envelope/'.
     * @type {Integer (Int32)}
     */
    static WS_ENVELOPE_VERSION_SOAP_1_1 => 1

    /**
     * The XML namespace for this version is: 'http://www.w3.org/2003/05/soap-envelope'.
     * @type {Integer (Int32)}
     */
    static WS_ENVELOPE_VERSION_SOAP_1_2 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_ENVELOPE_VERSION_NONE => 3
}
