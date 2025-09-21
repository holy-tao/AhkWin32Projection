#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_VIRTUAL_STATION_APIS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DOT11EXT_REQUEST_VIRTUAL_STATION>}
     */
    Dot11ExtRequestVirtualStation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DOT11EXT_RELEASE_VIRTUAL_STATION>}
     */
    Dot11ExtReleaseVirtualStation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DOT11EXT_QUERY_VIRTUAL_STATION_PROPERTIES>}
     */
    Dot11ExtQueryVirtualStationProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_VIRTUAL_STATION_AP_PROPERTIES>}
     */
    Dot11ExtSetVirtualStationAPProperties {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
