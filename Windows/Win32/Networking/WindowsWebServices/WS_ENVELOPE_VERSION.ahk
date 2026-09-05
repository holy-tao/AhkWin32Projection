#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The version of the specification used for the envelope structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_envelope_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_ENVELOPE_VERSION extends Win32Enum {

    /**
     * The XML namespace for this version is: 'http://schemas.xmlsoap.org/soap/envelope/'.
     * Native name: WS_ENVELOPE_VERSION_SOAP_1_1
     * @type {Integer (Int32)}
     */
    static SOAP_1_1 => 1

    /**
     * The XML namespace for this version is: 'http://www.w3.org/2003/05/soap-envelope'.
     * Native name: WS_ENVELOPE_VERSION_SOAP_1_2
     * @type {Integer (Int32)}
     */
    static SOAP_1_2 => 2

    /**
     * Native name: WS_ENVELOPE_VERSION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 3
}
