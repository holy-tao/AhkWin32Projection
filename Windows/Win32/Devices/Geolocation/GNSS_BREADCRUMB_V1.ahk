#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_BREADCRUMB_V1 {
    #StructPack 8

    FixTimeStamp : FILETIME

    Latitude : Float64

    Longitude : Float64

    HorizontalAccuracy : UInt32

    Speed : UInt16

    SpeedAccuracy : UInt16

    Altitude : Int16

    AltitudeAccuracy : UInt16

    Heading : Int16

    HeadingAccuracy : Int8

    FixSuccess : Int8

}
