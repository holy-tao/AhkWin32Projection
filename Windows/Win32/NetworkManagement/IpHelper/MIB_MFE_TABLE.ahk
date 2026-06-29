#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPMCAST_OIF_XP.ahk" { MIB_IPMCAST_OIF_XP }
#Import ".\MIB_IPMCAST_MFE.ahk" { MIB_IPMCAST_MFE }

/**
 * Contains a table of Multicast Forwarding Entries (MFEs).
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Server 2008and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_mfe_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_MFE_TABLE {
    #StructPack 4

    /**
     * The number of MFEs in the table.
     */
    dwNumEntries : UInt32

    /**
     * A pointer to a table of MFEs implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_mfe">MIB_IPMCAST_MFE</a> structures.
     */
    table : MIB_IPMCAST_MFE[1]

}
