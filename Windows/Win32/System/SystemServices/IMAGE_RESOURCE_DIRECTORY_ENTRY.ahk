#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_RESOURCE_DIRECTORY_ENTRY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - NameOffset
     * - NameIsString
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NameOffset {
        get => (this._bitfield >> 0) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 0) | (this._bitfield & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    NameIsString {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    Name {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OffsetToData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - OffsetToDirectory
     * - DataIsDirectory
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OffsetToDirectory {
        get => (this._bitfield1 >> 0) & 0x7FFFFFFF
        set => this._bitfield1 := ((value & 0x7FFFFFFF) << 0) | (this._bitfield1 & ~(0x7FFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    DataIsDirectory {
        get => (this._bitfield1 >> 31) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 31) | (this._bitfield1 & ~(0x1 << 31))
    }
}
