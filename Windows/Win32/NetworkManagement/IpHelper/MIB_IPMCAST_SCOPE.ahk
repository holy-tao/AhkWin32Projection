#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a multicast scope name and the associated IPv4 multicast group address and mask that define the scope.
 * @remarks
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_ipmcast_scope
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_SCOPE extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * A 32-bit integer representation of the IPv4 group address which, when combined with the corresponding value in <b>dwGroupMask</b>, identifies the group range for which the multicast scope exists. 
     * 
     * <div class="alert"><b>Note</b>  Scoped addresses must come from the range 239.*.*.* as specified in <a href="https://www.ietf.org/rfc/rfc2365.txt">RFC 2365</a>.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwGroupAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A 32-bit integer representation of the IPv4 group address mask which, when combined with the corresponding value in <b>dwGroupAddress</b>, identifies the group range for which the multicast scope exists.
     * @type {Integer}
     */
    dwGroupMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>WCHAR[256]</b>
     * 
     * A Unicode character array that contains the text name associated with the multicast scope. The name should be suitable for display to multicast application users.
     * 
     * If no name is specified, the default name is the string representation of the scoped address in <b>dwGroupAddress</b> with the address and mask length appended and separated by a slash "/" character, of the form "239.*.*.*.x/y", where <b>x</b> is the address length and <b>y</b> is the mask length.
     * @type {Array<UInt16>}
     */
    snNameBuffer{
        get {
            if(!this.HasProp("__snNameBufferProxyArray"))
                this.__snNameBufferProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "ushort")
            return this.__snNameBufferProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A status value that describes the current status of this row in a MFE scope table.
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
     * Row has <b>active</b> status.
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
     * Row has <b>notInService</b> status.
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
     * Row has <b>notReady</b> status.
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
     * Row has <b>createAndGo</b> status.
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
     * Row has <b>createAndWait</b> status.
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
     * Row has <b>destroy</b> status.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
