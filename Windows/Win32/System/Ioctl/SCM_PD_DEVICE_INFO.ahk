#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_DEVICE_INFO extends Win32Struct {
    static sizeof => 120

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
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(8, this)
            return this.__DeviceGuid
        }
    }

    /**
     * @type {Integer}
     */
    UnsafeShutdownCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PersistentMemorySizeInBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    VolatileMemorySizeInBytes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TotalMemorySizeInBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    DeviceHandle {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    PhysicalId {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    NumberOfFormatInterfaceCodes {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }

    /**
     * @type {Array<Integer>}
     */
    FormatInterfaceCodes {
        get {
            if(!this.HasProp("__FormatInterfaceCodesProxyArray"))
                this.__FormatInterfaceCodesProxyArray := Win32FixedArray(this.ptr + 68, 8, Primitive, "ushort")
            return this.__FormatInterfaceCodesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    ProductId {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    SubsystemDeviceId {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    SubsystemVendorId {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ManufacturingLocation {
        get => NumGet(this, 100, "char")
        set => NumPut("char", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    ManufacturingWeek {
        get => NumGet(this, 101, "char")
        set => NumPut("char", value, this, 101)
    }

    /**
     * @type {Integer}
     */
    ManufacturingYear {
        get => NumGet(this, 102, "char")
        set => NumPut("char", value, this, 102)
    }

    /**
     * @type {Integer}
     */
    SerialNumber4Byte {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    SerialNumberLengthInChars {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {String}
     */
    SerialNumber {
        get => StrGet(this.ptr + 112, 0, "UTF-8")
        set => StrPut(value, this.ptr + 112, 0, "UTF-8")
    }
}
