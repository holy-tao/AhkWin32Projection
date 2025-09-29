#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ContentDescriptor{
        get {
            if(!this.HasProp("__ContentDescriptorProxyArray"))
                this.__ContentDescriptorProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__ContentDescriptorProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReservedDoNotUse_UseAsByteInstead_0{
        get {
            if(!this.HasProp("__ReservedDoNotUse_UseAsByteInstead_0ProxyArray"))
                this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "char")
            return this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray
        }
    }

    /**
     * This bitfield backs the following members:
     * - RecordingWithinTheUserDataArea
     * - ReadingDiscControlBlocks
     * - FormattingTheMedium
     * - ModificationOfThisDiscControlBlock
     * - ReservedDoNotUse_UseAsByteInstead_1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    RecordingWithinTheUserDataArea {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ReadingDiscControlBlocks {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    FormattingTheMedium {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ModificationOfThisDiscControlBlock {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    ReservedDoNotUse_UseAsByteInstead_1 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Array<Byte>}
     */
    AsByte{
        get {
            if(!this.HasProp("__AsByteProxyArray"))
                this.__AsByteProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__AsByteProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VendorId{
        get {
            if(!this.HasProp("__VendorIdProxyArray"))
                this.__VendorIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__VendorIdProxyArray
        }
    }
}
