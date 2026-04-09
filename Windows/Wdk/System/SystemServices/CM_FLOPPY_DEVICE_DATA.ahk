#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class CM_FLOPPY_DEVICE_DATA extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {String}
     */
    Size {
        get => StrGet(this.ptr + 4, 7, "UTF-8")
        set => StrPut(value, this.ptr + 4, 7, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    MaxDensity {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MountDensity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StepRateHeadUnloadTime {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    HeadLoadTime {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * @type {Integer}
     */
    MotorOffTime {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    SectorLengthCode {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * @type {Integer}
     */
    SectorPerTrack {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ReadWriteGapLength {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    DataTransferLength {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    FormatGapLength {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * @type {Integer}
     */
    FormatFillCharacter {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    HeadSettleTime {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {Integer}
     */
    MotorSettleTime {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    MaximumTrackValue {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }

    /**
     * @type {Integer}
     */
    DataTransferRate {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }
}
