#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_SPEC_VERSION.ahk

/**
 * Describes a physical storage adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_adapter_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PHYSICAL_ADAPTER_DATA extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Specifies the adapter ID.
     * @type {Integer}
     */
    AdapterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_component_health_status">STORAGE_COMPONENT_HEALTH_STATUS</a>-typed value.
     * @type {Integer}
     */
    HealthStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a>-typed value.
     * @type {Integer}
     */
    CommandProtocol {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_spec_version">STORAGE_SPEC_VERSION</a>-typed value that specifies the supported storage spec version (for example, AHCI 1.3.1).
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
     * Specifies the adapter vendor.
     * @type {Array<Byte>}
     */
    Vendor{
        get {
            if(!this.HasProp("__VendorProxyArray"))
                this.__VendorProxyArray := Win32FixedArray(this.ptr + 24, 8, Primitive, "char")
            return this.__VendorProxyArray
        }
    }

    /**
     * Specifies the adapter model.
     * @type {Array<Byte>}
     */
    Model{
        get {
            if(!this.HasProp("__ModelProxyArray"))
                this.__ModelProxyArray := Win32FixedArray(this.ptr + 32, 40, Primitive, "char")
            return this.__ModelProxyArray
        }
    }

    /**
     * Specifies the firmware revision.
     * @type {Array<Byte>}
     */
    FirmwareRevision{
        get {
            if(!this.HasProp("__FirmwareRevisionProxyArray"))
                this.__FirmwareRevisionProxyArray := Win32FixedArray(this.ptr + 72, 16, Primitive, "char")
            return this.__FirmwareRevisionProxyArray
        }
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    PhysicalLocation{
        get {
            if(!this.HasProp("__PhysicalLocationProxyArray"))
                this.__PhysicalLocationProxyArray := Win32FixedArray(this.ptr + 88, 32, Primitive, "char")
            return this.__PhysicalLocationProxyArray
        }
    }

    /**
     * Indicates whether an expander is connected.
     * @type {Integer}
     */
    ExpanderConnected {
        get => NumGet(this, 120, "char")
        set => NumPut("char", value, this, 120)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 121, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 124, 3, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }
}
