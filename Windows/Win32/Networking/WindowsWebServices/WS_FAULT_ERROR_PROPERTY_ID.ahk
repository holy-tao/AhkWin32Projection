#Requires AutoHotkey v2.0.0 64-bit

/**
 * Information about a fault.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_fault_error_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FAULT_ERROR_PROPERTY_ID{

    /**
     * An optional <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> value that is the fault representation of the error.  If no
 *                     fault representation is present, then the value is <b>NULL</b>.
 *                 
 * 
 * To set the WS_FAULT value, pass a WS_FAULT* to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetfaulterrorproperty">WsSetFaultErrorProperty</a>.
 *                     The error object will make a copy of the WS_FAULT.  The error object will also
 *                     add the fault string of the fault to the set of error strings in the error object
 *                     if the language of the fault string matches that of the error object.
 *                 
 * 
 * To get the WS_FAULT value, pass a WS_FAULT** to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetfaulterrorproperty">WsGetFaultErrorProperty</a>, 
 *                     which will either return <b>NULL</b> (indicating no fault has been set), or will 
 *                     return a non-<b>NULL</b> pointer to the WS_FAULT.  The non-<b>NULL</b> pointer is valid until
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> are called for the error object.
 *                 
 * 
 * The default value is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_ERROR_PROPERTY_FAULT => 0

    /**
     * An optional <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> value representing the action to use for the fault.
 *                     If the length of the string is zero, then no action is present.
 *                 
 * 
 * To get the string value, pass a WS_XML_STRING* to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetfaulterrorproperty">WsGetFaultErrorProperty</a>.
 *                     The returned string is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> 
 *                     are called for the error object.
 *                 
 * 
 * To set the string value, pass a WS_XML_STRING* to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetfaulterrorproperty">WsSetFaultErrorProperty</a>.
 *                     The error object will make a copy of the string.
 *                 
 * 
 * The default value is a zero-length string.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_ERROR_PROPERTY_ACTION => 1

    /**
     * An optional <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> value representing a header to
 *                     add to the fault message relating to the fault.
 *                     If the pointer to the XML_BUFFER is <b>NULL</b>, then no header is present.
 *                 
 * 
 * To get the header value, pass a WS_XML_BUFFER** to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetfaulterrorproperty">WsGetFaultErrorProperty</a>.
 *                     The returned WS_XML_BUFFER is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> 
 *                     are called for the error object.
 *                 
 * 
 * To set the header value, pass a WS_XML_BUFFER** to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetfaulterrorproperty">WsSetFaultErrorProperty</a>.
 *                     The error object will make a copy of the buffer.
 *                 
 * 
 * The default value is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_ERROR_PROPERTY_HEADER => 2
}
