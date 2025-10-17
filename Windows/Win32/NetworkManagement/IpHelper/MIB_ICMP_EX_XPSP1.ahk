#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIBICMPSTATS_EX_XPSP1.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_ICMP_EX_XPSP1 extends Win32Struct
{
    static sizeof => 2064

    static packingSize => 8

    /**
     * @type {MIBICMPSTATS_EX_XPSP1}
     */
    icmpInStats{
        get {
            if(!this.HasProp("__icmpInStats"))
                this.__icmpInStats := MIBICMPSTATS_EX_XPSP1(0, this)
            return this.__icmpInStats
        }
    }

    /**
     * @type {MIBICMPSTATS_EX_XPSP1}
     */
    icmpOutStats{
        get {
            if(!this.HasProp("__icmpOutStats"))
                this.__icmpOutStats := MIBICMPSTATS_EX_XPSP1(1032, this)
            return this.__icmpOutStats
        }
    }
}
