#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_VIRTUAL_STATION_APIS {
    #StructPack 8

    Dot11ExtRequestVirtualStation : IntPtr

    Dot11ExtReleaseVirtualStation : IntPtr

    Dot11ExtQueryVirtualStationProperties : IntPtr

    Dot11ExtSetVirtualStationAPProperties : IntPtr

}
