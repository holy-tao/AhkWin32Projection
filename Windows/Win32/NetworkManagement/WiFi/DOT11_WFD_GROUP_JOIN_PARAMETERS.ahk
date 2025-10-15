#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CHANNEL.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_GROUP_JOIN_PARAMETERS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 5

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {DOT11_WFD_CHANNEL}
     */
    GOOperatingChannel{
        get {
            if(!this.HasProp("__GOOperatingChannel"))
                this.__GOOperatingChannel := DOT11_WFD_CHANNEL(this.ptr + 5)
            return this.__GOOperatingChannel
        }
    }

    /**
     * @type {Integer}
     */
    GOConfigTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    bInGroupFormation{
        get {
            if(!this.HasProp("__bInGroupFormation"))
                this.__bInGroupFormation := BOOLEAN(this.ptr + 16)
            return this.__bInGroupFormation
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bWaitForWPSReady{
        get {
            if(!this.HasProp("__bWaitForWPSReady"))
                this.__bWaitForWPSReady := BOOLEAN(this.ptr + 17)
            return this.__bWaitForWPSReady
        }
    }
}
