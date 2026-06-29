#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_BREADCRUMBING_ALERT_DATA {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    Unused : Int8[512]

}
