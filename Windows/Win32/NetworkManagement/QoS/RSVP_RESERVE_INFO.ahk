#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS object RSVP_RESERVE_INFO, through the ProviderSpecific buffer, enables RSVP behavior for a given flow to be specified or modified at a granular level, and enables default RSVP style settings for a flow to be overridden.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_reserve_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_RESERVE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(this.ptr + 0)
            return this.__ObjectHdr
        }
    }

    /**
     * Specifies the RSVP reservation style for a given flow, and can be used to replace default reservation styles placed on a particular type of flow. More information about RSVP reservation styles, and the default settings for certain QOS-enabled socket sessions, can be found under
     * @type {Integer}
     */
    Style {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Can be used by a receiving application to request notification of its reservation request by setting <b>ConfirmRequest</b> to a nonzero value. Such notification is achieved when RSVP-aware devices in the data path between sender and receiver (or vice-versa) transmit an RESV CONFIRMATION message toward the requesting node. Note that an RSVP node is not required to automatically generate RESV CONFIRMATION messages.
     * @type {Integer}
     */
    ConfirmRequest {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pointer to the set of policy elements. Optional policy information, as provided in an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_policy_info">RSVP_POLICY_INFO</a> structure.
     * @type {Pointer<RSVP_POLICY_INFO>}
     */
    PolicyElementList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the FLOWDESCRIPTOR count.
     * @type {Integer}
     */
    NumFlowDesc {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to the list of FLOWDESCRIPTORs.
     * @type {Pointer<FLOWDESCRIPTOR>}
     */
    FlowDescList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
