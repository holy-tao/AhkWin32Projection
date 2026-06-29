#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SATELLITEINFO {
    #StructPack 8

    SatelliteId : UInt32

    UsedInPositiong : BOOL

    Elevation : Float64

    Azimuth : Float64

    SignalToNoiseRatio : Float64

}
