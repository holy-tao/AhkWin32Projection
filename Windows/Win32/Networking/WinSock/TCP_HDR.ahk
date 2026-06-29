#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_HDR {
    #StructPack 4

    th_sport : UInt16

    th_dport : UInt16

    th_seq : UInt32

    th_ack : UInt32

    /**
     * This bitfield backs the following members:
     * - th_x2
     * - th_len
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    th_x2 {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    th_len {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    th_flags : Int8

    th_win : UInt16

    th_sum : UInt16

    th_urp : UInt16

}
