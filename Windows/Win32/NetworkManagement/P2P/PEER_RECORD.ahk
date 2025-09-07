#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\PEER_DATA.ahk

/**
 * The PEER_RECORD structure contains the record object that an application uses.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_RECORD extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Specifies the size of a structure.  Set the value to   sizeof(<b>PEER_RECORD</b>).
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of  record. The  type is a <b>GUID</b> that an application must specify.  The <b>GUID</b> represents a unique record type, for example, a chat record.
     * @type {Pointer<Guid>}
     */
    type {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the unique ID of a record. The Peer Infrastructure supplies this ID. This parameter is ignored in calls to  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>. An application cannot modify this member.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the version of a record that   the Peer Infrastructure supplies when an application  calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>. An application cannot modify this member.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the flags that indicate  special processing, which must be applied to  a record.  The following table identifies the valid values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PEER_RECORD_FLAG_AUTOREFRESH</b></td>
     * <td>Indicates that a record is automatically refreshed when it is ready to expire.	</td>
     * </tr>
     * <tr>
     * <td><b>PEER_RECORD_FLAG_DELETED</b></td>
     * <td>Indicates that a record is marked as deleted. </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>   An application cannot set these flags.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Pointer to the unique ID of a record creator.   This member is set to <b>NULL</b> for calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a> and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>. An application cannot set this member.
     * @type {Pointer<Ptr>}
     */
    pwzCreatorId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the unique ID of  the last person who changes a record. An application cannot set this member.
     * @type {Pointer<Ptr>}
     */
    pwzModifiedById {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the set of attribute name and value pairs that are   associated with a record. This member points to   an XML string. Record attributes are specified as an XML string,  and they must be consistent with the Peer Infrastructure record attribute schema.   For a complete explanation of the XML schema, see <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/record-attribute-schema">Record Attribute Schema</a>.
     * 
     * The Peer Infrastructure reserves several attribute names that a user cannot set. The following list identifies the reserved attribute names:<ul>
     * <li><b>peerlastmodifiedby</b></li>
     * <li><b>peercreatorid</b></li>
     * <li><b>peerlastmodificationtime</b></li>
     * <li><b>peerrecordid</b></li>
     * <li><b>peerrecordtype</b></li>
     * <li><b>peercreationtime</b></li>
     * <li><b>peerlastmodificationtime</b></li>
     * </ul>
     * @type {Pointer<Ptr>}
     */
    pwzAttributes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Specifies the Coordinated Universal Time (UTC) that a record is created. The Peer Infrastructure supplies this value, and the value is set to zero (0) in calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>. An application cannot set this member.
     * @type {FILETIME}
     */
    ftCreation{
        get {
            if(!this.HasProp("__ftCreation"))
                this.__ftCreation := FILETIME(this.ptr + 56)
            return this.__ftCreation
        }
    }

    /**
     * The UTC time that a record expires. This member is required.  It can be updated to a time value greater than the originally specified time value, but  it cannot be less than the  originally specified value.
     * 
     * <div class="alert"><b>Note</b>   If <b>dwFlags</b> is set to <b>PEER_RECORD_FLAG_AUTOREFRESH</b>, do not set the value  of   <b>ftExpiration</b> to less than four (4) minutes. If this member is set to less than four (4) minutes, undefined behavior can occur.</div>
     * <div> </div>
     * @type {FILETIME}
     */
    ftExpiration{
        get {
            if(!this.HasProp("__ftExpiration"))
                this.__ftExpiration := FILETIME(this.ptr + 64)
            return this.__ftExpiration
        }
    }

    /**
     * The UTC time that a record is modified.   The Peer Infrastructure supplies this value. Set this member to  <b>NULL</b> when  calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupupdaterecord">PeerGroupUpdateRecord</a>. An application cannot set this member.
     * @type {FILETIME}
     */
    ftLastModified{
        get {
            if(!this.HasProp("__ftLastModified"))
                this.__ftLastModified := FILETIME(this.ptr + 72)
            return this.__ftLastModified
        }
    }

    /**
     * Specifies the security data contained in a  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure. The Graphing API uses this member, and provides  the security provider with a place to store security data, for example, a signature.  The Grouping API cannot modify this member.
     * @deprecated
     * @type {PEER_DATA}
     */
    securityData{
        get {
            if(!this.HasProp("__securityData"))
                this.__securityData := PEER_DATA(this.ptr + 80)
            return this.__securityData
        }
    }

    /**
     * Specifies the actual data that this record contains.
     * @deprecated
     * @type {PEER_DATA}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := PEER_DATA(this.ptr + 96)
            return this.__data
        }
    }
}
