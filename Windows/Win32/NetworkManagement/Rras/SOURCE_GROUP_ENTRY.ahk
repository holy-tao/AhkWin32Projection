#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOURCE_GROUP_ENTRY structure describes the entry returned by the group enumeration function MgmGroupEnumerationGetNext.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/ns-mgm-source_group_entry
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class SOURCE_GROUP_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the source address from which to receive multicast data. Specify zero to receive data from all sources (a wildcard receiver for a group); otherwise, specify the IP address of the source or source network. 
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, specify the source network using <b>dwSourceAddr</b>, and specify a subnet mask using <b>dwSourceMask</b>.
     * @type {Integer}
     */
    dwSourceAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the subnet mask that corresponds to <b>dwSourceAddr</b>. The <b>dwSourceAddr</b> and <b>dwSourceMask</b> parameters are used together to define a range of sources from which to receive multicast data. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <b>dwSourceAddr</b> (a wildcard receiver).
     * @type {Integer}
     */
    dwSourceMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the multicast group for which to receive data. Specify zero to receive all groups (a wildcard receiver); otherwise, specify the IP address of the group. 
     * 
     * 
     * 
     * 
     * To specify a range of group addresses, specify the group address using <b>dwGroupAddr</b>, and specify a subnet mask using <b>dwGroupMask</b>.
     * @type {Integer}
     */
    dwGroupAddr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the subnet mask that corresponds to <b>dwGroupAddr</b>. The <b>dwGroupAddr</b> and <b>dwGroupMask</b> parameters are used together to define a range of multicast groups. 
     * 
     * 
     * 
     * 
     * Specify zero for this parameter if zero was specified for <b>dwGroupAddr</b> (a wildcard receiver).
     * @type {Integer}
     */
    dwGroupMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
