#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_GRAPH_PROPERTIES structure contains data about the policy of a peer graph, ID, scope, and other information.
 * @remarks
 * 
  * An application can force the Peer Graphing Infrastructure to publish presence information by using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphsetpresence">PeerGraphSetPresence</a>.
  * 
  * Only specific  fields in the <b>PEER_GRAPH_PROPERTIES</b> can be updated when calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphsetproperties">PeerGraphSetProperties</a>. The following members can be updated:
  * 
  * <ul>
  * <li><b>pwzFriendlyName</b></li>
  * <li><b>pwzComment</b></li>
  * <li><b>ulPresenceLifetime</b></li>
  * <li><b>cPresenceMax</b></li>
  * </ul>
  * The remaining members cannot be modified.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_graph_properties
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_PROPERTIES extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of this data structure.  The <b>dwSize</b> member must be set  to the size of <b>PEER_GRAPH_PROPERTIES</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>. This member is required. There is not a default value.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags that control  the behavior of a peer in a graph. The default is does not have flags set. The valid value is identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PEER_GRAPH_PROPERTY_DEFER_EXPIRATION</b></td>
     * <td>Specifies when to expire a graph record. When a graph is not connected and this flag is set, expiration does not occur until the graph connects to at least one other member. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the  scope in which the peer graph ID is published. The default value is global.  Valid values are identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PEER_GRAPH_SCOPE_GLOBAL</b></td>
     * <td>Scope includes the Internet.</td>
     * </tr>
     * <tr>
     * <td><b>PEER_GRAPH_SCOPE_LINK_LOCAL</b></td>
     * <td>Scope is restricted to a local subnet.</td>
     * </tr>
     * <tr>
     * <td><b>PEER_GRAPH_SCOPE_SITE_LOCAL</b></td>
     * <td>Scope is restricted to a site, for example, a corporation intranet.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the value that indicates the largest record that can be added to a peer graph. A valid value is zero (0), which indicates that the default maximum record size is used (60 megabytes), and any value between 1024 bytes and 60 megabytes.
     * @type {Integer}
     */
    dwMaxRecordSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the unique identifier for a peer graph.  This ID must be unique for the computer/user pair. This member is required  and has no default value. If the string value is greater than 256 characters (including the null terminator), an error is returned.
     * @type {Pointer<Char>}
     */
    pwzGraphId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the unique identifier for the creator of a peer graph. This member is required  and has no default value. If the string value is greater than 256 characters (including the null terminator), an error is returned.
     * @type {Pointer<Char>}
     */
    pwzCreatorId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the friendly name of a peer graph. This member is optional and can be <b>NULL</b>. The default value is <b>NULL</b>. The maximum length of this string is 256 characters, including the null terminator.
     * @type {Pointer<Char>}
     */
    pwzFriendlyName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the comment used to describe a peer  graph. This member is optional and can be <b>NULL</b>. The default value is <b>NULL</b>. The maximum length of this string is 512 characters, including the null terminator.
     * @type {Pointer<Char>}
     */
    pwzComment {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the number of seconds before a presence record  expires. The default value is 300  seconds (5 minutes). Do not set the value  of   <b>ulPresenceLifetime</b> to less than 300 seconds. If this member is set less than the 300  (5 minutes) default value, then undefined behavior can occur.
     * @type {Integer}
     */
    ulPresenceLifetime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies how many presence records the Peer Infrastructure keeps in a peer graph at one time.   A node that has its presence published can be enumerated by all other nodes with  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphenumnodes">PeerGraphEnumNodes</a>. Specify how presence records for users are published by specifying one of the values identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>-1</td>
     * <td>Presence records are automatically published for all users.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Presence records are not automatically published.</td>
     * </tr>
     * <tr>
     * <td>1-N</td>
     * <td>Up to N number of presence records are  published at one time. The presence records that are published are randomly chosen by the Peer Graphing Infrastructure. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    cPresenceMax {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
