#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The PEER_EVENT_MEMBER_CHANGE_DATA structure contains data that describes a change in the status of a peer group member.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_member_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_MEMBER_CHANGE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the size of this structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>PEER_MEMBER_CHANGE_TYPE</b> enumeration value that specifies the change event that occurred, such as a member joining or leaving.
     * @deprecated
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pointer to a Unicode string that contains the peer name of the peer group member.
     * @type {PWSTR}
     */
    pwzIdentity{
        get {
            if(!this.HasProp("__pwzIdentity"))
                this.__pwzIdentity := PWSTR(this.ptr + 8)
            return this.__pwzIdentity
        }
    }
}
