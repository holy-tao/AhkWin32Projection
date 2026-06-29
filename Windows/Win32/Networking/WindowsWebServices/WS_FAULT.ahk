#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_FAULT_CODE.ahk" { WS_FAULT_CODE }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_FAULT_REASON.ahk" { WS_FAULT_REASON }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }

/**
 * A Fault is a value carried in the body of a message which conveys a processing failure. Faults are modeled using the WS_FAULT structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FAULT {
    #StructPack 8

    /**
     * The head of the list of fault codes which identifies the type of fault.
     *                 
     * 
     * The fault codes are ordered from most generic to most specific.
     *                     There must be at least one fault code.  The first fault code
     *                     must correspond to a fault code defined by SOAP.
     *                     For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, only the most specific fault code
     *                     is serialized (the first one in the list).
     *                 
     * 
     * If the namespace URI of the first fault code is the empty string,
     *                     then the first fault code will be transformed as follows
     *                     when the fault is serialized, as follows:
     *                 
     * 
     * <ul>
     * <li>The appropriate SOAP namespace will be used based on the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION</a>.
     *                     </li>
     * <li>If the local name is "Sender" when using 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, then "Client" will be used instead.
     *                     </li>
     * <li>If the local name is "Receiver" when using
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, then "Server" will be used instead.
     *                 </li>
     * </ul>
     * These transformations allow a SOAP fault code
     *                     to be specified without having to worry about which SOAP version is used.
     */
    code : WS_FAULT_CODE.Ptr

    /**
     * The text describing the fault.  This is an array to allow for different
     *                     languages.
     */
    reasons : WS_FAULT_REASON.Ptr

    /**
     * The number of reasons in the reasons array.  This would be more than one
     *                     if the text was represented in multiple languages.  There must be at
     *                     least one fault reason.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, only the first reason is serialized.
     */
    reasonCount : UInt32

    /**
     * The name of the processor that caused the fault.  If the string is zero
     *                     length, then it's assumed to be the endpoint.
     */
    actor : WS_STRING

    /**
     * The location of the processor that caused the fault.  If the string is zero
     *                     length, then it's assumed to be the endpoint.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, this value is not serialized.
     */
    node : WS_STRING

    /**
     * The fault detail allows for XML content to be included along with the fault.  If
     *                     there is no detail, then this field may be <b>NULL</b>.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, this should only be used if the fault
     *                     does not relate to processing of a header of the message.  Faults relating to
     *                     headers should use a custom header to relay information about the fault.
     *                 
     * 
     * If there is detail for the fault, the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> should contain 
     *                     an element that corresponds to the detail element of a SOAP fault.  The
     *                     fault-specific XML content is contained within the detail element.
     *                     The local name and namespace of the element are ignored; they are replaced with
     *                     the appropriate element name according to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION</a> when the detail element is written.
     */
    detail : WS_XML_BUFFER.Ptr

}
