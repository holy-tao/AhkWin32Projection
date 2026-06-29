#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_ENDPOINT_OFFLOAD_MODE.ahk" { USBD_ENDPOINT_OFFLOAD_MODE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_ENDPOINT_OFFLOAD_INFORMATION_V1 {
    #StructPack 8

    Size : UInt32

    EndpointAddress : UInt16

    ResourceId : UInt32

    Mode : USBD_ENDPOINT_OFFLOAD_MODE

    /**
     * This bitfield backs the following members:
     * - RootHubPortNumber
     * - RouteString
     * - Speed
     */
    _bitfield1 : Int32


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
     */
    _bitfield2 : Int32


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
    TransferSegmentLA : Int64

    TransferSegmentVA : IntPtr

    TransferRingSize : IntPtr

    TransferRingInitialCycleBit : UInt32

    MessageNumber : UInt32

    EventRingSegmentLA : Int64

    EventRingSegmentVA : IntPtr

    EventRingSize : IntPtr

    EventRingInitialCycleBit : UInt32

}
