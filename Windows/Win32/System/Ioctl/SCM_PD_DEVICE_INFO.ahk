#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_DEVICE_INFO extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DeviceGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    UnsafeShutdownCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PersistentMemorySizeInBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    VolatileMemorySizeInBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TotalMemorySizeInBytes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    DeviceHandle {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    PhysicalId {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    NumberOfFormatInterfaceCodes {
        get => NumGet(this, 58, "char")
        set => NumPut("char", value, this, 58)
    }

    /**
     * @type {Array<UInt16>}
     */
    FormatInterfaceCodes{
        get {
            if(!this.HasProp("__FormatInterfaceCodesProxyArray"))
                this.__FormatInterfaceCodesProxyArray := Win32FixedArray(this.ptr + 60, 8, Primitive, "ushort")
            return this.__FormatInterfaceCodesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    ProductId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    SubsystemDeviceId {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    SubsystemVendorId {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ManufacturingLocation {
        get => NumGet(this, 92, "char")
        set => NumPut("char", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    ManufacturingWeek {
        get => NumGet(this, 93, "char")
        set => NumPut("char", value, this, 93)
    }

    /**
     * @type {Integer}
     */
    ManufacturingYear {
        get => NumGet(this, 94, "char")
        set => NumPut("char", value, this, 94)
    }

    /**
     * @type {Integer}
     */
    SerialNumber4Byte {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    SerialNumberLengthInChars {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {String}
     */
    SerialNumber {
        get => StrGet(this.ptr + 104, 0, "UTF-16")
        set => StrPut(value, this.ptr + 104, 0, "UTF-16")
    }
}
