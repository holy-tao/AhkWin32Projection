#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSERIALIZEDEVENT {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - eEventId
     * - elParamType
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    eEventId {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    elParamType {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    ulStreamNum : UInt32

    ullAudioStreamOffset : Int64

    SerializedwParam : UInt32

    SerializedlParam : Int32

}
