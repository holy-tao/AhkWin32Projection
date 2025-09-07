#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended statistics for either incoming or outgoing Internet Control Message Protocol (ICMP) messages on a particular computer.
 * @remarks
 * Two 
  * <b>MIBICMPSTATS_EX</b> structures are required to hold all the extended ICMP statistics for a given computer. One 
  * <b>MIBICMPSTATS_EX</b> structure contains the extended statistics for incoming ICMP messages. The other contains the extended statistics for outgoing ICMP messages. For this reason, the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_icmp_ex_xpsp1">MIB_ICMP_EX</a> structure contains two 
  * <b>MIBICMPSTATS_EX</b> structures.
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIBICMPSTATS_EX</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mibicmpstats_ex_xpsp1
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIBICMPSTATS_EX_XPSP1 extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the number of messages received or sent.
     * @type {Integer}
     */
    dwMsgs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     *  The number of errors received or sent.
     * @type {Integer}
     */
    dwErrors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD[256]</b>
     * 
     * The type count.
     * @type {Array<UInt32>}
     */
    rgdwTypeCount{
        get {
            if(!this.HasProp("__rgdwTypeCountProxyArray"))
                this.__rgdwTypeCountProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__rgdwTypeCountProxyArray
        }
    }
}
