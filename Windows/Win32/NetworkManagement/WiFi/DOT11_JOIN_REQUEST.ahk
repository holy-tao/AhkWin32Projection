#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_RATE_SET.ahk
#Include .\DOT11_BSS_DESCRIPTION.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_JOIN_REQUEST extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uJoinFailureTimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DOT11_RATE_SET}
     */
    OperationalRateSet{
        get {
            if(!this.HasProp("__OperationalRateSet"))
                this.__OperationalRateSet := DOT11_RATE_SET(8, this)
            return this.__OperationalRateSet
        }
    }

    /**
     * @type {Integer}
     */
    uChCenterFrequency {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {DOT11_BSS_DESCRIPTION}
     */
    dot11BSSDescription{
        get {
            if(!this.HasProp("__dot11BSSDescription"))
                this.__dot11BSSDescription := DOT11_BSS_DESCRIPTION(144, this)
            return this.__dot11BSSDescription
        }
    }
}
