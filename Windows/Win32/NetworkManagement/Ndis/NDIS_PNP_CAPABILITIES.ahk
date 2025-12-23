#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_PM_WAKE_UP_CAPABILITIES.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PNP_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {NDIS_PM_WAKE_UP_CAPABILITIES}
     */
    WakeUpCapabilities{
        get {
            if(!this.HasProp("__WakeUpCapabilities"))
                this.__WakeUpCapabilities := NDIS_PM_WAKE_UP_CAPABILITIES(4, this)
            return this.__WakeUpCapabilities
        }
    }
}
