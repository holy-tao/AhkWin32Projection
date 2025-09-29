#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_LB_PROVISIONING_MAP_RESOURCES extends Win32Struct
{
    static sizeof => 32

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
     * This bitfield backs the following members:
     * - AvailableMappingResourcesValid
     * - UsedMappingResourcesValid
     * - Reserved0
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AvailableMappingResourcesValid {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    UsedMappingResourcesValid {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 9, 3, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - AvailableMappingResourcesScope
     * - UsedMappingResourcesScope
     * - Reserved2
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    AvailableMappingResourcesScope {
        get => (this._bitfield2 >> 0) & 0x3
        set => this._bitfield2 := ((value & 0x3) << 0) | (this._bitfield2 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    UsedMappingResourcesScope {
        get => (this._bitfield2 >> 2) & 0x3
        set => this._bitfield2 := ((value & 0x3) << 2) | (this._bitfield2 & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield2 >> 4) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AvailableMappingResources {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    UsedMappingResources {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
