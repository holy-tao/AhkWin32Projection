#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_MULTISAMPLEQUALITYLEVELSDATA {
    #StructPack 8

    gdi2 : IntPtr

    Format : D3DFORMAT

    /**
     * This bitfield backs the following members:
     * - bFlip
     * - MSType
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    bFlip {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MSType {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    QualityLevels : UInt32

}
