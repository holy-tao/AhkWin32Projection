#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class WS_FAULT_DETAIL_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The action associated with the fault message.
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
     * The description of the fault detail of the fault.  This 
     *                     field must be specified (it may not be <b>NULL</b>).
     * @type {Pointer<WS_ELEMENT_DESCRIPTION>}
     */
    detailElementDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
