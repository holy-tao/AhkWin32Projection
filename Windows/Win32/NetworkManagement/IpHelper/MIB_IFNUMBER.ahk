#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the number of interfaces on a particular computer.
 * @remarks
 * The <b>MIB_IFNUMBER</b> structure is not currently used. The <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_iftable">MIB_IFTABLE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_table2">MIB_IF_TABLE2</a> structures contain a <b>dwNumEntries</b> member that can be used instead of the <b>MIB_IFNUMBER</b> structure.
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IFNUMBER</b> structure is defined in the <i>Ifmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ifmib.h</i> header file is automatically included in <i>Ipmib.h</i> header file. This file is automatically included in the <i>Iprtrmib.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ifmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ifmib/ns-ifmib-mib_ifnumber
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IFNUMBER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The number of interfaces on the computer.
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
