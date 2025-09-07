#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The schema for the input/output WS_MESSAGE for a given operation description.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_message_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_MESSAGE_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The action associated with the respective input/output <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     *                 
     * 
     * If the message does not have an action, this field can be <b>NULL</b>.
     * @type {Pointer<WS_XML_STRING>}
     */
    action {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The description of the value within the body of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     *                 
     * 
     * If <b>NULL</b>, then the message body is assumed to be empty.
     *                 
     * 
     * If non-<b>NULL</b>, this value is read or written as described in
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.
     * @type {Pointer<WS_ELEMENT_DESCRIPTION>}
     */
    bodyElementDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
