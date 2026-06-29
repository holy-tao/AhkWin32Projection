#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA_BASIC {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    Latitude : Float64

    Longitude : Float64

    Altitude : Float64

    Speed : Float64

    Heading : Float64

}
