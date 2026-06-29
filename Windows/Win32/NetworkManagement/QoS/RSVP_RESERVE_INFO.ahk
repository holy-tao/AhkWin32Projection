#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import ".\FLOWDESCRIPTOR.ahk" { FLOWDESCRIPTOR }
#Import ".\RSVP_POLICY_INFO.ahk" { RSVP_POLICY_INFO }

/**
 * The QOS object RSVP_RESERVE_INFO, through the ProviderSpecific buffer, enables RSVP behavior for a given flow to be specified or modified at a granular level, and enables default RSVP style settings for a flow to be overridden.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_reserve_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_RESERVE_INFO {
    #StructPack 8

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Specifies the RSVP reservation style for a given flow, and can be used to replace default reservation styles placed on a particular type of flow. More information about RSVP reservation styles, and the default settings for certain QOS-enabled socket sessions, can be found under
     */
    Style : UInt32

    /**
     * Can be used by a receiving application to request notification of its reservation request by setting <b>ConfirmRequest</b> to a nonzero value. Such notification is achieved when RSVP-aware devices in the data path between sender and receiver (or vice-versa) transmit an RESV CONFIRMATION message toward the requesting node. Note that an RSVP node is not required to automatically generate RESV CONFIRMATION messages.
     */
    ConfirmRequest : UInt32

    /**
     * Pointer to the set of policy elements. Optional policy information, as provided in an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_policy_info">RSVP_POLICY_INFO</a> structure.
     */
    PolicyElementList : RSVP_POLICY_INFO.Ptr

    /**
     * Specifies the FLOWDESCRIPTOR count.
     */
    NumFlowDesc : UInt32

    /**
     * Pointer to the list of FLOWDESCRIPTORs.
     */
    FlowDescList : FLOWDESCRIPTOR.Ptr

}
