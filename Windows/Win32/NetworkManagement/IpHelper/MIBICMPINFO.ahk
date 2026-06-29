#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIBICMPSTATS.ahk" { MIBICMPSTATS }

/**
 * Contains Internet Control Message Protocol (ICMP) statistics for a particular computer.
 * @remarks
 * Two 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structures are required to hold all the ICMP statistics for a given computer. One 
 * <b>MIBICMPSTATS</b> structure contains the statistics for incoming ICMP messages. The other contains the statistics for outgoing ICMP messages. For this reason, the 
 * <b>MIBICMPINFO</b> structure contains two 
 * <b>MIBICMPSTATS</b> structures.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIBICMPINFO</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mibicmpinfo
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIBICMPINFO {
    #StructPack 4

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structure that contains the statistics for incoming ICMP messages.
     */
    icmpInStats : MIBICMPSTATS

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structure that contains the statistics for outgoing ICMP messages.
     */
    icmpOutStats : MIBICMPSTATS

}
