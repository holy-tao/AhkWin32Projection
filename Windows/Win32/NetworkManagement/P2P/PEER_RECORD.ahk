#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_RECORD structure contains the record object that an application uses.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_record
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_RECORD {
    #StructPack 8

    /**
     * Specifies the size of a structure.  Set the value to   sizeof(<b>PEER_RECORD</b>).
     */
    dwSize : UInt32

    /**
     * Specifies the type of  record. The  type is a <b>GUID</b> that an application must specify.  The <b>GUID</b> represents a unique record type, for example, a chat record.
     */
    type : Guid

    /**
     * Specifies the unique ID of a record. The Peer Infrastructure supplies this ID. This parameter is ignored in calls to  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>. An application cannot modify this member.
     */
    id : Guid

    /**
     * Specifies the version of a record that   the Peer Infrastructure supplies when an application  calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>. An application cannot modify this member.
     */
    dwVersion : UInt32

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
     */
    dwFlags : UInt32

    /**
     * Pointer to the unique ID of a record creator.   This member is set to <b>NULL</b> for calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a> and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>. An application cannot set this member.
     */
    pwzCreatorId : PWSTR

    /**
     * Specifies the unique ID of  the last person who changes a record. An application cannot set this member.
     */
    pwzModifiedById : PWSTR

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
     */
    pwzAttributes : PWSTR

    /**
     * Specifies the Coordinated Universal Time (UTC) that a record is created. The Peer Infrastructure supplies this value, and the value is set to zero (0) in calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>. An application cannot set this member.
     */
    ftCreation : FILETIME

    /**
     * The UTC time that a record expires. This member is required.  It can be updated to a time value greater than the originally specified time value, but  it cannot be less than the  originally specified value.
     * 
     * <div class="alert"><b>Note</b>   If <b>dwFlags</b> is set to <b>PEER_RECORD_FLAG_AUTOREFRESH</b>, do not set the value  of   <b>ftExpiration</b> to less than four (4) minutes. If this member is set to less than four (4) minutes, undefined behavior can occur.</div>
     * <div> </div>
     */
    ftExpiration : FILETIME

    /**
     * The UTC time that a record is modified.   The Peer Infrastructure supplies this value. Set this member to  <b>NULL</b> when  calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphaddrecord">PeerGraphAddRecord</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphupdaterecord">PeerGraphUpdateRecord</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupaddrecord">PeerGroupAddRecord</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupupdaterecord">PeerGroupUpdateRecord</a>. An application cannot set this member.
     */
    ftLastModified : FILETIME

    /**
     * Specifies the security data contained in a  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure. The Graphing API uses this member, and provides  the security provider with a place to store security data, for example, a signature.  The Grouping API cannot modify this member.
     * @deprecated
     */
    securityData : PEER_DATA

    /**
     * Specifies the actual data that this record contains.
     * @deprecated
     */
    data : PEER_DATA

}
