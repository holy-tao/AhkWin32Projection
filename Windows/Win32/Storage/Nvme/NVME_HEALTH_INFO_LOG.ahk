#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_health_info_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HEALTH_INFO_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - AvailableSpaceLow
     * - TemperatureThreshold
     * - ReliabilityDegraded
     * - ReadOnly
     * - VolatileMemoryBackupDeviceFailed
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AvailableSpaceLow {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TemperatureThreshold {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ReliabilityDegraded {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ReadOnly {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    VolatileMemoryBackupDeviceFailed {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Temperature{
        get {
            if(!this.HasProp("__TemperatureProxyArray"))
                this.__TemperatureProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
            return this.__TemperatureProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AvailableSpare {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    AvailableSpareThreshold {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PercentageUsed {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 6, 26, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DataUnitRead{
        get {
            if(!this.HasProp("__DataUnitReadProxyArray"))
                this.__DataUnitReadProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__DataUnitReadProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DataUnitWritten{
        get {
            if(!this.HasProp("__DataUnitWrittenProxyArray"))
                this.__DataUnitWrittenProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__DataUnitWrittenProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    HostReadCommands{
        get {
            if(!this.HasProp("__HostReadCommandsProxyArray"))
                this.__HostReadCommandsProxyArray := Win32FixedArray(this.ptr + 64, 16, Primitive, "char")
            return this.__HostReadCommandsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    HostWrittenCommands{
        get {
            if(!this.HasProp("__HostWrittenCommandsProxyArray"))
                this.__HostWrittenCommandsProxyArray := Win32FixedArray(this.ptr + 80, 16, Primitive, "char")
            return this.__HostWrittenCommandsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ControllerBusyTime{
        get {
            if(!this.HasProp("__ControllerBusyTimeProxyArray"))
                this.__ControllerBusyTimeProxyArray := Win32FixedArray(this.ptr + 96, 16, Primitive, "char")
            return this.__ControllerBusyTimeProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PowerCycle{
        get {
            if(!this.HasProp("__PowerCycleProxyArray"))
                this.__PowerCycleProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__PowerCycleProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PowerOnHours{
        get {
            if(!this.HasProp("__PowerOnHoursProxyArray"))
                this.__PowerOnHoursProxyArray := Win32FixedArray(this.ptr + 128, 16, Primitive, "char")
            return this.__PowerOnHoursProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UnsafeShutdowns{
        get {
            if(!this.HasProp("__UnsafeShutdownsProxyArray"))
                this.__UnsafeShutdownsProxyArray := Win32FixedArray(this.ptr + 144, 16, Primitive, "char")
            return this.__UnsafeShutdownsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MediaErrors{
        get {
            if(!this.HasProp("__MediaErrorsProxyArray"))
                this.__MediaErrorsProxyArray := Win32FixedArray(this.ptr + 160, 16, Primitive, "char")
            return this.__MediaErrorsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ErrorInfoLogEntryCount{
        get {
            if(!this.HasProp("__ErrorInfoLogEntryCountProxyArray"))
                this.__ErrorInfoLogEntryCountProxyArray := Win32FixedArray(this.ptr + 176, 16, Primitive, "char")
            return this.__ErrorInfoLogEntryCountProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    WarningCompositeTemperatureTime {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    CriticalCompositeTemperatureTime {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor1 {
        get => NumGet(this, 200, "ushort")
        set => NumPut("ushort", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor2 {
        get => NumGet(this, 202, "ushort")
        set => NumPut("ushort", value, this, 202)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor3 {
        get => NumGet(this, 204, "ushort")
        set => NumPut("ushort", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor4 {
        get => NumGet(this, 206, "ushort")
        set => NumPut("ushort", value, this, 206)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor5 {
        get => NumGet(this, 208, "ushort")
        set => NumPut("ushort", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor6 {
        get => NumGet(this, 210, "ushort")
        set => NumPut("ushort", value, this, 210)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor7 {
        get => NumGet(this, 212, "ushort")
        set => NumPut("ushort", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    TemperatureSensor8 {
        get => NumGet(this, 214, "ushort")
        set => NumPut("ushort", value, this, 214)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 216, 296, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
