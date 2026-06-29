#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MIPI_DSI_PACKET {
    #StructPack 2

    DataId : Int8


    /**
     * @type {Integer}
     */
    DataType {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    VirtualChannel {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
    Data0 : Int8

    Data1 : Int8

    EccFiller : Int8

    Payload : Int8[8]

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'LongWriteWordCount', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
