#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIBICMPINFO.ahk" { MIBICMPINFO }
#Import ".\MIBICMPSTATS.ahk" { MIBICMPSTATS }

/**
 * Contains the Internet Control Message Protocol (ICMP) statistics for a particular computer.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_ICMP</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_icmp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_ICMP {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpinfo">MIBICMPINFO</a> structure that contains the ICMP statistics for the computer.
     */
    stats : MIBICMPINFO

}
