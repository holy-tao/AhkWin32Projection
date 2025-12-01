#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPMCAST_OIF_STATS_LH.ahk
#Include .\MIB_IPMCAST_MFE_STATS.ahk

/**
 * Stores statistics for a group of Multicast Forwarding Entries (MFEs).
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Server 2008and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_mfe_stats_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_MFE_STATS_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of MFEs  in the array.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of MFEs that are implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats">MIB_IPMCAST_MFE_STATS</a> structures.
     * @type {Array<MIB_IPMCAST_MFE_STATS>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IPMCAST_MFE_STATS, "")
            return this.__tableProxyArray
        }
    }
}
