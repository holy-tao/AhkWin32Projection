#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIPI_DSI_PACKET.ahk" { MIPI_DSI_PACKET }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MIPI_DSI_TRANSMISSION {
    #StructPack 4

    TotalBufferSize : UInt32

    PacketCount : Int8

    FailedPacket : Int8

    /**
     * This bitfield backs the following members:
     * - TransmissionMode
     * - ReportMipiErrors
     * - ClearMipiErrors
     * - SecondaryPort
     * - ManufacturingMode
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    TransmissionMode {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    ReportMipiErrors {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ClearMipiErrors {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    SecondaryPort {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    ManufacturingMode {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    ReadWordCount : UInt16

    FinalCommandExtraPayload : UInt16

    MipiErrors : UInt16

    HostErrors : UInt16

    Packets : MIPI_DSI_PACKET[1]

}
