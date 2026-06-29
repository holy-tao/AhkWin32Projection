#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_EXPORTED_ISOLATED_KEY_HEADER {
    #StructPack 4

    Version : UInt32

    KeyUsage : UInt32

    /**
     * This bitfield backs the following members:
     * - PerBootKey
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PerBootKey {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    cbAlgName : UInt32

    cbNonce : UInt32

    cbAuthTag : UInt32

    cbWrappingKey : UInt32

    cbIsolatedKey : UInt32

}
