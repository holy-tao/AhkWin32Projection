#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_AZCC_ROOT_BUS_LIST_EVENT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_EVENT_LOG_ENTRY>}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RootBusCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    RootBuses{
        get {
            if(!this.HasProp("__RootBusesProxyArray"))
                this.__RootBusesProxyArray := Win32FixedArray(this.ptr + 12, 8, Primitive, "uint")
            return this.__RootBusesProxyArray
        }
    }
}
