#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_ELEMENT_DESCRIPTION.ahk" { WS_ELEMENT_DESCRIPTION }

/**
 * A description of the detail element of a fault message.
 * @remarks
 * The fault description defines the action of the fault message
 *                 along with a description of the detail element that is
 *                 contained within the fault.
 *             
 * 
 * The fault description can be used to set and get the
 *                 fault detail element stored within a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object
 *                 using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetfaulterrordetail">WsSetFaultErrorDetail</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetfaulterrordetail">WsGetFaultErrorDetail</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_detail_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FAULT_DETAIL_DESCRIPTION {
    #StructPack 8

    /**
     * The action associated with the fault message.
     *                 
     * 
     * If the message does not have an action, this field can be <b>NULL</b>.
     */
    action : WS_XML_STRING.Ptr

    /**
     * The description of the fault detail of the fault.  This 
     *                     field must be specified (it may not be <b>NULL</b>).
     */
    detailElementDescription : WS_ELEMENT_DESCRIPTION.Ptr

}
