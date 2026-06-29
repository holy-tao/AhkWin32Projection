#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIBICMPSTATS_EX_XPSP1.ahk" { MIBICMPSTATS_EX_XPSP1 }

/**
 * Contains the extended Internet Control Message Protocol (ICMP) statistics for a particular computer.
 * @remarks
 * Two 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats_ex_xpsp1">MIBICMPSTATS_EX</a> structures are required to hold all the extended ICMP statistics for a given computer. One 
 * <b>MIBICMPSTATS_EX</b> structure contains the extended statistics for incoming ICMP messages. The other contains the extended statistics for outgoing ICMP messages. For this reason, the 
 * <b>MIB_ICMP_EX</b> structure contains two 
 * <b>MIBICMPSTATS_EX</b> structures.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_ICMP_EX</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_icmp_ex_xpsp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_ICMP_EX_XPSP1 {
    #StructPack 4

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats_ex_xpsp1">MIBICMPSTATS_EX</a> structure that contains the extended statistics for incoming ICMP messages.
     */
    icmpInStats : MIBICMPSTATS_EX_XPSP1

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats_ex_xpsp1">MIBICMPSTATS_EX</a> structure that contains the extended statistics for outgoing ICMP messages.
     */
    icmpOutStats : MIBICMPSTATS_EX_XPSP1

}
