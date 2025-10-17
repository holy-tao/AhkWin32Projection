#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIBICMPSTATS.ahk

/**
 * Contains Internet Control Message Protocol (ICMP) statistics for a particular computer.
 * @remarks
 * 
  * Two 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structures are required to hold all the ICMP statistics for a given computer. One 
  * <b>MIBICMPSTATS</b> structure contains the statistics for incoming ICMP messages. The other contains the statistics for outgoing ICMP messages. For this reason, the 
  * <b>MIBICMPINFO</b> structure contains two 
  * <b>MIBICMPSTATS</b> structures.
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIBICMPINFO</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipmib/ns-ipmib-mibicmpinfo
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIBICMPINFO extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structure that contains the statistics for incoming ICMP messages.
     * @type {MIBICMPSTATS}
     */
    icmpInStats{
        get {
            if(!this.HasProp("__icmpInStats"))
                this.__icmpInStats := MIBICMPSTATS(0, this)
            return this.__icmpInStats
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mibicmpstats">MIBICMPSTATS</a> structure that contains the statistics for outgoing ICMP messages.
     * @type {MIBICMPSTATS}
     */
    icmpOutStats{
        get {
            if(!this.HasProp("__icmpOutStats"))
                this.__icmpOutStats := MIBICMPSTATS(56, this)
            return this.__icmpOutStats
        }
    }
}
