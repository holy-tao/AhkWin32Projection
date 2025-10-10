#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk
#Include .\RSVP_POLICY.ahk

/**
 * The RSVP_POLICY_INFO structure stores undefined policy elements retrieved from RSVP.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-rsvp_policy_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_POLICY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * QOS object header that specifies the size and length of the QOS object.
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
     * Number of policy elements in <b>PolicyElement</b>.
     * @type {Integer}
     */
    NumPolicyElement {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * List of policy elements received, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_policy">RSVP_POLICY</a> structure.
     * @type {Array<RSVP_POLICY>}
     */
    PolicyElement{
        get {
            if(!this.HasProp("__PolicyElementProxyArray"))
                this.__PolicyElementProxyArray := Win32FixedArray(this.ptr + 16, 1, RSVP_POLICY, "")
            return this.__PolicyElementProxyArray
        }
    }
}
