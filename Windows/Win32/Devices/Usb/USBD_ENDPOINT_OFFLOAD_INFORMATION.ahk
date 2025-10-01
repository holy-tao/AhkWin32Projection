#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBD_ENDPOINT_OFFLOAD_INFORMATION extends Win32Struct
{
    static sizeof => 136

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
    EndpointAddress {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ResourceId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * This bitfield backs the following members:
     * - RootHubPortNumber
     * - RouteString
     * - Speed
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RootHubPortNumber {
        get => (this._bitfield1 >> 0) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 0) | (this._bitfield1 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    RouteString {
        get => (this._bitfield1 >> 8) & 0xFFFFF
        set => this._bitfield1 := ((value & 0xFFFFF) << 8) | (this._bitfield1 & ~(0xFFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => (this._bitfield1 >> 28) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 28) | (this._bitfield1 & ~(0xF << 28))
    }

    /**
     * This bitfield backs the following members:
     * - UsbDeviceAddress
     * - SlotId
     * - MultiTT
     * - LSOrFSDeviceConnectedToTTHub
     * - Reserved0
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    UsbDeviceAddress {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    SlotId {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    MultiTT {
        get => (this._bitfield2 >> 16) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 16) | (this._bitfield2 & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    LSOrFSDeviceConnectedToTTHub {
        get => (this._bitfield2 >> 17) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 17) | (this._bitfield2 & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield2 >> 18) & 0x3FFF
        set => this._bitfield2 := ((value & 0x3FFF) << 18) | (this._bitfield2 & ~(0x3FFF << 18))
    }

    /**
     * @type {Integer}
     */
    TransferSegmentLA {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferSegmentVA {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    TransferRingSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TransferRingInitialCycleBit {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MessageNumber {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    EventRingSegmentLA {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    EventRingSegmentVA {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    EventRingSize {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    EventRingInitialCycleBit {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ClientTransferRingSegmentPAIn {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    ClientTransferRingSizeIn {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ClientDataBufferPAIn {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Pointer}
     */
    ClientDataBufferSizeIn {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    ClientDataBufferLAOut {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * @type {Pointer<Void>}
     */
    ClientDataBufferVAOut {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
