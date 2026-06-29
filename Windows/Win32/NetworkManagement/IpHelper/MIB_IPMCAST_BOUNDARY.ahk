#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a row in a MIB_IPMCAST_BOUNDARY_TABLE structure that lists a router's scoped IPv4 multicast address boundaries.
 * @remarks
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_BOUNDARY {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The index value for the interface to which this boundary applies. Packets with a destination address in the associated address/mask range are not forwarded with this interface.
     */
    dwIfIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The 32-bit integer representation of the IPv4 group address which, when combined with the corresponding value in <b>dwGroupMask</b>, identifies the group range for which the scoped boundary exists. 
     * 
     * <div class="alert"><b>Note</b>  Scoped addresses must come from the range 239.*.*.* as specified in <a href="https://www.ietf.org/rfc/rfc2365.txt">RFC 2365</a>.</div>
     * <div> </div>
     */
    dwGroupAddress : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The 32-bit integer representation of the IPv4 group address mask which, when combined with the corresponding value in <b>dwGroupAddress</b>, identifies the group range for which the scoped boundary exists.
     */
    dwGroupMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A status value that describes the current status of this entry in a MFE boundary table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry has <b>active</b> status.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry has <b>notInService</b> status.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry  has <b>notReady</b> status.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry has <b>createAndGo</b> status.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry has <b>createAndWait</b> status.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entry has <b>destroy</b> status.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwStatus : UInt32

}
