#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_STRING.ahk

/**
 * A Fault is a value carried in the body of a message which conveys a processing failure. Faults are modeled using the WS_FAULT structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FAULT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

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
     * @type {Pointer<WS_FAULT_CODE>}
     */
    code {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The text describing the fault.  This is an array to allow for different
     *                     languages.
     * @type {Pointer<WS_FAULT_REASON>}
     */
    reasons {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of reasons in the reasons array.  This would be more than one
     *                     if the text was represented in multiple languages.  There must be at
     *                     least one fault reason.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, only the first reason is serialized.
     * @type {Integer}
     */
    reasonCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the processor that caused the fault.  If the string is zero
     *                     length, then it's assumed to be the endpoint.
     * @type {WS_STRING}
     */
    actor{
        get {
            if(!this.HasProp("__actor"))
                this.__actor := WS_STRING(this.ptr + 24)
            return this.__actor
        }
    }

    /**
     * The location of the processor that caused the fault.  If the string is zero
     *                     length, then it's assumed to be the endpoint.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION_SOAP_1_1</a>, this value is not serialized.
     * @type {WS_STRING}
     */
    node{
        get {
            if(!this.HasProp("__node"))
                this.__node := WS_STRING(this.ptr + 40)
            return this.__node
        }
    }

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
     * @type {Pointer<IntPtr>}
     */
    detail {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
