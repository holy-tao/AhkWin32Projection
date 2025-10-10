#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the index of the interface that has the best route to a particular destination IPv4 address.
 * @remarks
 * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_BEST_IF</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iprtrmib/ns-iprtrmib-mib_best_if
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_BEST_IF extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the IPv4 address of the destination.
     * @type {Integer}
     */
    dwDestAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the index of the interface that has the best route to the destination address specified by the <b>dwDestAddr</b> member.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
