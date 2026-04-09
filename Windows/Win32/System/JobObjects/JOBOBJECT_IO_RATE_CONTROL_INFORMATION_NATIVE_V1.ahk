#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOB_OBJECT_IO_RATE_CONTROL_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V1 extends Win32Struct {
    static sizeof => 48

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
    VolumeName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    BaseIoSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {JOB_OBJECT_IO_RATE_CONTROL_FLAGS}
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
}
