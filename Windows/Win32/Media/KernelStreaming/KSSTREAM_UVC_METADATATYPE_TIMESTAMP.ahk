#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAM_UVC_METADATATYPE_TIMESTAMP {
    #StructPack 4

    PresentationTimeStamp : UInt32

    SourceClockReference : UInt32

    /**
     * This bitfield backs the following members:
     * - Counter
     * - Reserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Counter {
        get => (this._bitfield >> 0) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 0) | (this._bitfield & ~(0x7FF << 0))
    }
    Reserved0 : UInt16

    Reserved1 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'SCRToken', { type: UInt16, offset: 8 })
        this.DeleteProp("__New")
    }
}
