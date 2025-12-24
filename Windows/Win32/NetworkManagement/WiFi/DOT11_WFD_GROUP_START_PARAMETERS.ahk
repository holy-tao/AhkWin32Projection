#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CHANNEL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_GROUP_START_PARAMETERS extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

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
     * @type {DOT11_WFD_CHANNEL}
     */
    AdvertisedOperatingChannel{
        get {
            if(!this.HasProp("__AdvertisedOperatingChannel"))
                this.__AdvertisedOperatingChannel := DOT11_WFD_CHANNEL(4, this)
            return this.__AdvertisedOperatingChannel
        }
    }
}
