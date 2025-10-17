#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_MAC_FRAME_STATISTICS.ahk
#Include .\DOT11_PHY_FRAME_STATISTICS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_STATISTICS extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    ullFourWayHandshakeFailures {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ullTKIPCounterMeasuresInvoked {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ullReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {DOT11_MAC_FRAME_STATISTICS}
     */
    MacUcastCounters{
        get {
            if(!this.HasProp("__MacUcastCounters"))
                this.__MacUcastCounters := DOT11_MAC_FRAME_STATISTICS(32, this)
            return this.__MacUcastCounters
        }
    }

    /**
     * @type {DOT11_MAC_FRAME_STATISTICS}
     */
    MacMcastCounters{
        get {
            if(!this.HasProp("__MacMcastCounters"))
                this.__MacMcastCounters := DOT11_MAC_FRAME_STATISTICS(144, this)
            return this.__MacMcastCounters
        }
    }

    /**
     * @type {Array<DOT11_PHY_FRAME_STATISTICS>}
     */
    PhyCounters{
        get {
            if(!this.HasProp("__PhyCountersProxyArray"))
                this.__PhyCountersProxyArray := Win32FixedArray(this.ptr + 256, 1, DOT11_PHY_FRAME_STATISTICS, "")
            return this.__PhyCountersProxyArray
        }
    }
}
