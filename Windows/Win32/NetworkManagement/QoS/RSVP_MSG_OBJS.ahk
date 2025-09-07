#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RSVP_MSG_OBJS structure contains RSVP message objects.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvp_msg_objs
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_MSG_OBJS extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * RSVP message type.
     * @type {Integer}
     */
    RsvpMsgType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvp_session">RSVP_SESSION</a> object containing an RSVP session object.
     * @type {Pointer<RSVP_SESSION>}
     */
    pRsvpSession {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvp_hop">RSVP_HOP</a> structure indicating the hop from which the message has come.
     * @type {Pointer<RSVP_HOP>}
     */
    pRsvpFromHop {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvp_hop">RSVP_HOP</a> structure indicating the hop to which the message shall be sent.
     * @type {Pointer<RSVP_HOP>}
     */
    pRsvpToHop {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reservation style, expressed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-resv_style">RESV_STYLE</a> structure.
     * @type {Pointer<RESV_STYLE>}
     */
    pResvStyle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Scope of the reservation message.
     * @type {Pointer<RSVP_SCOPE>}
     */
    pRsvpScope {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of flow descriptors in the message.
     * @type {Integer}
     */
    FlowDescCount {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Pointer to the first <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-flow_desc">FLOW_DESC</a> structure in the message.
     * @type {Pointer<FLOW_DESC>}
     */
    pFlowDescs {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Number of policy data objects in the message.
     * @type {Integer}
     */
    PdObjectCount {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Pointer to the first <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-policy_data">POLICY_DATA</a> structure in the message.
     * @type {Pointer<POLICY_DATA>}
     */
    ppPdObjects {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-error_spec">ERROR_SPEC</a> structure containing an error message.
     * @type {Pointer<ERROR_SPEC>}
     */
    pErrorSpec {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-adspec">ADSPEC</a> structure containing an Adspec message.
     * @type {Pointer<ADSPEC>}
     */
    pAdspec {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
