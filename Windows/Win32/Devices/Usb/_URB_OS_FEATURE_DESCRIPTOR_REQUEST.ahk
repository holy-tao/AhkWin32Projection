#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk
#Include .\_URB_HCD_AREA.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_OS_FEATURE_DESCRIPTOR_REQUEST extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    Hdr{
        get {
            if(!this.HasProp("__Hdr"))
                this.__Hdr := _URB_HEADER(0, this)
            return this.__Hdr
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TransferBufferLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferBuffer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferBufferMDL {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<URB>}
     */
    UrbLink {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {_URB_HCD_AREA}
     */
    hca{
        get {
            if(!this.HasProp("__hca"))
                this.__hca := _URB_HCD_AREA(64, this)
            return this.__hca
        }
    }

    /**
     * This bitfield backs the following members:
     * - Recipient
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 128, "char")
        set => NumPut("char", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    Recipient {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 129, "char")
        set => NumPut("char", value, this, 129)
    }

    /**
     * @type {Integer}
     */
    InterfaceNumber {
        get => NumGet(this, 130, "char")
        set => NumPut("char", value, this, 130)
    }

    /**
     * @type {Integer}
     */
    MS_PageIndex {
        get => NumGet(this, 131, "char")
        set => NumPut("char", value, this, 131)
    }

    /**
     * @type {Integer}
     */
    MS_FeatureDescriptorIndex {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 134, "ushort")
        set => NumPut("ushort", value, this, 134)
    }
}
