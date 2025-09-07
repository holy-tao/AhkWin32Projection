#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V3 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MaxIops {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaxBandwidth {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ReservationIops {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    VolumeName{
        get {
            if(!this.HasProp("__VolumeName"))
                this.__VolumeName := PWSTR(this.ptr + 24)
            return this.__VolumeName
        }
    }

    /**
     * @type {Integer}
     */
    BaseIoSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    VolumeNameLength {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CriticalReservationIops {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ReservationBandwidth {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CriticalReservationBandwidth {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    MaxTimePercent {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    ReservationTimePercent {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    CriticalReservationTimePercent {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    SoftMaxIops {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    SoftMaxBandwidth {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    SoftMaxTimePercent {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    LimitExcessNotifyIops {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    LimitExcessNotifyBandwidth {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    LimitExcessNotifyTimePercent {
        get => NumGet(this, 136, "int64")
        set => NumPut("int64", value, this, 136)
    }
}
