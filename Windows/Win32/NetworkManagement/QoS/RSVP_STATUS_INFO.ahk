#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS object RSVP_STATUS_INFO provides information regarding the status of RSVP for a given flow, including event notifications associated with monitoring FD_QOS events, as well as error information.
 * @remarks
 * 
 * When applications register their interest in FD_QOS events (see 
 * <a href="https://docs.microsoft.com/previous-versions/aa374065(v=vs.80)">QOS Events</a>), event and error information is associated with the event in the form of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-qos">QOS</a> structure that is associated with the event. For more detailed information associated with that event, applications can investigate the <b>RSVP_STATUS_INFO</b> object that is provided in 
 * <a href="https://docs.microsoft.com/previous-versions/aa374467(v=vs.80)">the ProviderSpecific buffer</a> of the event-associated 
 * <b>QOS</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-rsvp_status_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_STATUS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * Status information. See Winsock2.h for more information.
     * @type {Integer}
     */
    StatusCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Mechanism for storing or returning provider-specific status information. The <i>ExtendedStatus1</i> parameter is used for storing a higher-level, or generalized error code, and is augmented by finer-grained error information provided in ExtendedStatus2.
     * @type {Integer}
     */
    ExtendedStatus1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Additional mechanism for storing or returning provider-specific status information. Provides finer-grained error information compared to the generalized error information provided in <i>ExtendedStatus1</i>.
     * @type {Integer}
     */
    ExtendedStatus2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
