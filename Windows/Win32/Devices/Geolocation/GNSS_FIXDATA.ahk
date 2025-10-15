#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\NTSTATUS.ahk
#Include .\GNSS_FIXDATA_BASIC.ahk
#Include .\GNSS_FIXDATA_ACCURACY.ahk
#Include .\GNSS_SATELLITEINFO.ahk
#Include .\GNSS_FIXDATA_SATELLITE.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXDATA extends Win32Struct
{
    static sizeof => 680

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
                this.__FixTimeStamp := FILETIME(this.ptr + 16)
            return this.__FixTimeStamp
        }
    }

    /**
     * @type {BOOL}
     */
    IsFinalFix{
        get {
            if(!this.HasProp("__IsFinalFix"))
                this.__IsFinalFix := BOOL(this.ptr + 24)
            return this.__IsFinalFix
        }
    }

    /**
     * @type {NTSTATUS}
     */
    FixStatus{
        get {
            if(!this.HasProp("__FixStatus"))
                this.__FixStatus := NTSTATUS(this.ptr + 28)
            return this.__FixStatus
        }
    }

    /**
     * @type {Integer}
     */
    FixLevelOfDetails {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {GNSS_FIXDATA_BASIC}
     */
    BasicData{
        get {
            if(!this.HasProp("__BasicData"))
                this.__BasicData := GNSS_FIXDATA_BASIC(this.ptr + 40)
            return this.__BasicData
        }
    }

    /**
     * @type {GNSS_FIXDATA_ACCURACY}
     */
    AccuracyData{
        get {
            if(!this.HasProp("__AccuracyData"))
                this.__AccuracyData := GNSS_FIXDATA_ACCURACY(this.ptr + 88)
            return this.__AccuracyData
        }
    }

    /**
     * @type {GNSS_FIXDATA_SATELLITE}
     */
    SatelliteData{
        get {
            if(!this.HasProp("__SatelliteData"))
                this.__SatelliteData := GNSS_FIXDATA_SATELLITE(this.ptr + 152)
            return this.__SatelliteData
        }
    }
}
