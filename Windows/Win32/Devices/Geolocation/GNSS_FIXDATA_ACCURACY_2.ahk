#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA_ACCURACY_2 {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    HorizontalAccuracy : Float64

    HorizontalErrorMajorAxis : Float64

    HorizontalErrorMinorAxis : Float64

    HorizontalErrorAngle : Float64

    HeadingAccuracy : Float64

    AltitudeAccuracy : Float64

    SpeedAccuracy : Float64

    HorizontalConfidence : UInt32

    HeadingConfidence : UInt32

    AltitudeConfidence : UInt32

    SpeedConfidence : UInt32

    PositionDilutionOfPrecision : Float64

    HorizontalDilutionOfPrecision : Float64

    VerticalDilutionOfPrecision : Float64

    GeometricDilutionOfPrecision : Float64

    TimeDilutionOfPrecision : Float64

}
