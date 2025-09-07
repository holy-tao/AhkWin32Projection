#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about the capabilities and enrollment requirements of the sensor adapter for a biometric unit.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-extended-sensor-info
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EXTENDED_SENSOR_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The generic capabilities of the sensor component that is connected to a specific biometric unit.
     * @type {Integer}
     */
    GenericSensorCapabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of biometric unit for which this structure contains information about capabilities and enrollment requirements of the sensor adapter. For example, if the value of the **Factor** member is **WINBIO\_TYPE\_FINGERPRINT**, the **WINBIO\_EXTENDED\_SENSOR\_INFO** structure applies to a fingerprint reader and contains the relevant information in the **Specifc.Fingerprint** structure.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {RECT}
     */
    FrameSize{
        get {
            if(!this.HasProp("__FrameSize"))
                this.__FrameSize := RECT(this.ptr + 8)
            return this.__FrameSize
        }
    }

    /**
     * @type {POINT}
     */
    FrameOffset{
        get {
            if(!this.HasProp("__FrameOffset"))
                this.__FrameOffset := POINT(this.ptr + 24)
            return this.__FrameOffset
        }
    }

    /**
     * @type {Integer}
     */
    MandatoryOrientation {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {String}
     */
    ColorSensorId {
        get => StrGet(this.ptr + 40, 259, "UTF-16")
        set => StrPut(value, this.ptr + 40, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    InfraredSensorId {
        get => StrGet(this.ptr + 560, 259, "UTF-16")
        set => StrPut(value, this.ptr + 560, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    InfraredSensorRotationAngle {
        get => NumGet(this, 1080, "uint")
        set => NumPut("uint", value, this, 1080)
    }

    /**
     * @type {Integer}
     */
    Fingerprint {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Voice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
