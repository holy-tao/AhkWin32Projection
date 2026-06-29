#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXDATA_ACCURACY {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    HorizontalAccuracy : UInt32

    HorizontalErrorMajorAxis : UInt32

    HorizontalErrorMinorAxis : UInt32

    HorizontalErrorAngle : UInt32

    HeadingAccuracy : UInt32

    AltitudeAccuracy : UInt32

    SpeedAccuracy : UInt32

    HorizontalConfidence : UInt32

    HeadingConfidence : UInt32

    AltitudeConfidence : UInt32

    SpeedConfidence : UInt32

    PositionDilutionOfPrecision : Float32

    HorizontalDilutionOfPrecision : Float32

    VerticalDilutionOfPrecision : Float32

}
