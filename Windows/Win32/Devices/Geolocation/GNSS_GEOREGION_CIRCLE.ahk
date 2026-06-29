#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOREGION_CIRCLE {
    #StructPack 8

    Latitude : Float64

    Longitude : Float64

    RadiusInMeters : Float64

}
