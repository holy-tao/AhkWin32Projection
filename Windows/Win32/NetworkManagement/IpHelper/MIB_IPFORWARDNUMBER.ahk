#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the number of routes in a particular IP routing table.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipforwardnumber
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPFORWARDNUMBER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the number of routes in the IP routing table.
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
