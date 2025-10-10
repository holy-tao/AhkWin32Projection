#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_SPEC_VERSION.ahk

/**
 * Describes a physical storage device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_physical_device_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PHYSICAL_DEVICE_DATA extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Specifies the device ID.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Value(s) of bitmask from STORAGE_COMPONENT_ROLE_xxx
     * @type {Integer}
     */
    Role {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_component_health_status">STORAGE_COMPONENT_HEALTH_STATUS</a> enumeration.
     * @type {Integer}
     */
    HealthStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a> enumeration.
     * @type {Integer}
     */
    CommandProtocol {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_spec_version">STORAGE_SPEC_VERSION</a> structure that specifies the supported storage spec version. For example: SBC 3, SATA 3.2, NVMe 1.2
     * @type {STORAGE_SPEC_VERSION}
     */
    SpecVersion{
        get {
            if(!this.HasProp("__SpecVersion"))
                this.__SpecVersion := STORAGE_SPEC_VERSION(this.ptr + 16)
            return this.__SpecVersion
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_device_form_factor">STORAGE_DEVICE_FORM_FACTOR</a> enumeration.
     * @type {Integer}
     */
    FormFactor {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies the device vendor.
     * @type {Array<Byte>}
     */
    Vendor{
        get {
            if(!this.HasProp("__VendorProxyArray"))
                this.__VendorProxyArray := Win32FixedArray(this.ptr + 28, 8, Primitive, "char")
            return this.__VendorProxyArray
        }
    }

    /**
     * Specifies the device model.
     * @type {Array<Byte>}
     */
    Model{
        get {
            if(!this.HasProp("__ModelProxyArray"))
                this.__ModelProxyArray := Win32FixedArray(this.ptr + 36, 40, Primitive, "char")
            return this.__ModelProxyArray
        }
    }

    /**
     * Specifies the firmware revision of the device.
     * @type {Array<Byte>}
     */
    FirmwareRevision{
        get {
            if(!this.HasProp("__FirmwareRevisionProxyArray"))
                this.__FirmwareRevisionProxyArray := Win32FixedArray(this.ptr + 76, 16, Primitive, "char")
            return this.__FirmwareRevisionProxyArray
        }
    }

    /**
     * In units of kilobytes (1024 bytes).
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    PhysicalLocation{
        get {
            if(!this.HasProp("__PhysicalLocationProxyArray"))
                this.__PhysicalLocationProxyArray := Win32FixedArray(this.ptr + 104, 32, Primitive, "char")
            return this.__PhysicalLocationProxyArray
        }
    }

    /**
     * 
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 136, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
