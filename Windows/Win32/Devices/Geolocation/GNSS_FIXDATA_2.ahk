#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\GNSS_FIXDATA_BASIC_2.ahk
#Include .\GNSS_FIXDATA_ACCURACY_2.ahk
#Include .\GNSS_SATELLITEINFO.ahk
#Include .\GNSS_FIXDATA_SATELLITE.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXDATA_2 extends Win32Struct
{
    static sizeof => 744

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
     * @type {Integer}
     */
    FixSessionID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {FILETIME}
     */
    FixTimeStamp{
        get {
            if(!this.HasProp("__FixTimeStamp"))
                this.__FixTimeStamp := FILETIME(16, this)
            return this.__FixTimeStamp
        }
    }

    /**
     * @type {BOOL}
     */
    IsFinalFix {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {NTSTATUS}
     */
    FixStatus {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    FixLevelOfDetails {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {GNSS_FIXDATA_BASIC_2}
     */
    BasicData{
        get {
            if(!this.HasProp("__BasicData"))
                this.__BasicData := GNSS_FIXDATA_BASIC_2(40, this)
            return this.__BasicData
        }
    }

    /**
     * @type {GNSS_FIXDATA_ACCURACY_2}
     */
    AccuracyData{
        get {
            if(!this.HasProp("__AccuracyData"))
                this.__AccuracyData := GNSS_FIXDATA_ACCURACY_2(96, this)
            return this.__AccuracyData
        }
    }

    /**
     * @type {GNSS_FIXDATA_SATELLITE}
     */
    SatelliteData{
        get {
            if(!this.HasProp("__SatelliteData"))
                this.__SatelliteData := GNSS_FIXDATA_SATELLITE(216, this)
            return this.__SatelliteData
        }
    }
}
