#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING.ahk" { D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING }
#Import ".\D3DKMDT_VIDEO_SIGNAL_STANDARD.ahk" { D3DKMDT_VIDEO_SIGNAL_STANDARD }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDEO_SIGNAL_INFO {
    #StructPack 8


    struct _AdditionalSignalInfo {
        /**
         * This bitfield backs the following members:
         * - ScanLineOrdering
         * - VSyncFreqDivider
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        ScanLineOrdering {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        VSyncFreqDivider {
            get => (this._bitfield >> 3) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 3) | (this._bitfield & ~(0x3F << 3))
        }
    }

    VideoStandard : D3DKMDT_VIDEO_SIGNAL_STANDARD

    TotalSize : IntPtr

    ActiveSize : IntPtr

    VSyncFreq : IntPtr

    HSyncFreq : IntPtr

    PixelRate : IntPtr

    AdditionalSignalInfo : D3DKMDT_VIDEO_SIGNAL_INFO._AdditionalSignalInfo

    static __New() {
        DefineProp(this.Prototype, 'ScanLineOrdering', { type: D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING, offset: 48 })
        this.DeleteProp("__New")
    }
}
