#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }

/**
 * The QOS object RSVP_STATUS_INFO provides information regarding the status of RSVP for a given flow, including event notifications associated with monitoring FD_QOS events, as well as error information.
 * @remarks
 * When applications register their interest in FD_QOS events (see 
 * <a href="https://docs.microsoft.com/previous-versions/aa374065(v=vs.80)">QOS Events</a>), event and error information is associated with the event in the form of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure that is associated with the event. For more detailed information associated with that event, applications can investigate the <b>RSVP_STATUS_INFO</b> object that is provided in 
 * <a href="https://docs.microsoft.com/previous-versions/aa374467(v=vs.80)">the ProviderSpecific buffer</a> of the event-associated 
 * <b>QOS</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_status_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_STATUS_INFO {
    #StructPack 4

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Status information. See Winsock2.h for more information.
     */
    StatusCode : UInt32

    /**
     * Mechanism for storing or returning provider-specific status information. The <i>ExtendedStatus1</i> parameter is used for storing a higher-level, or generalized error code, and is augmented by finer-grained error information provided in ExtendedStatus2.
     */
    ExtendedStatus1 : UInt32

    /**
     * Additional mechanism for storing or returning provider-specific status information. Provides finer-grained error information compared to the generalized error information provided in <i>ExtendedStatus1</i>.
     */
    ExtendedStatus2 : UInt32

}
