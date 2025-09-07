#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXDATA_ACCURACY_2 extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Float}
     */
    HorizontalAccuracy {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    HorizontalErrorMajorAxis {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Float}
     */
    HorizontalErrorMinorAxis {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * @type {Float}
     */
    HorizontalErrorAngle {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * @type {Float}
     */
    HeadingAccuracy {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * @type {Float}
     */
    AltitudeAccuracy {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }

    /**
     * @type {Float}
     */
    SpeedAccuracy {
        get => NumGet(this, 56, "double")
        set => NumPut("double", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    HorizontalConfidence {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    HeadingConfidence {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    AltitudeConfidence {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    SpeedConfidence {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Float}
     */
    PositionDilutionOfPrecision {
        get => NumGet(this, 80, "double")
        set => NumPut("double", value, this, 80)
    }

    /**
     * @type {Float}
     */
    HorizontalDilutionOfPrecision {
        get => NumGet(this, 88, "double")
        set => NumPut("double", value, this, 88)
    }

    /**
     * @type {Float}
     */
    VerticalDilutionOfPrecision {
        get => NumGet(this, 96, "double")
        set => NumPut("double", value, this, 96)
    }

    /**
     * @type {Float}
     */
    GeometricDilutionOfPrecision {
        get => NumGet(this, 104, "double")
        set => NumPut("double", value, this, 104)
    }

    /**
     * @type {Float}
     */
    TimeDilutionOfPrecision {
        get => NumGet(this, 112, "double")
        set => NumPut("double", value, this, 112)
    }
}
