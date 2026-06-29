#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import ".\RSVP_POLICY.ahk" { RSVP_POLICY }

/**
 * The RSVP_POLICY_INFO structure stores undefined policy elements retrieved from RSVP.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_policy_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_POLICY_INFO {
    #StructPack 4

    /**
     * QOS object header that specifies the size and length of the QOS object.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Number of policy elements in <b>PolicyElement</b>.
     */
    NumPolicyElement : UInt32

    /**
     * List of policy elements received, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_policy">RSVP_POLICY</a> structure.
     */
    PolicyElement : RSVP_POLICY[1]

}
