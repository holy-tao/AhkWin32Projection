#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_ELEMENT_DESCRIPTION.ahk" { WS_ELEMENT_DESCRIPTION }

/**
 * The schema for the input/output WS_MESSAGE for a given operation description.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_message_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_MESSAGE_DESCRIPTION {
    #StructPack 8

    /**
     * The action associated with the respective input/output <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     *                 
     * 
     * If the message does not have an action, this field can be <b>NULL</b>.
     */
    action : WS_XML_STRING.Ptr

    /**
     * The description of the value within the body of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     *                 
     * 
     * If <b>NULL</b>, then the message body is assumed to be empty.
     *                 
     * 
     * If non-<b>NULL</b>, this value is read or written as described in
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.
     */
    bodyElementDescription : WS_ELEMENT_DESCRIPTION.Ptr

}
