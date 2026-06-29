#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_SCANLINE_ORDERING.ahk" { DISPLAYCONFIG_SCANLINE_ORDERING }
#Import ".\DISPLAYCONFIG_2DREGION.ahk" { DISPLAYCONFIG_2DREGION }
#Import ".\DISPLAYCONFIG_RATIONAL.ahk" { DISPLAYCONFIG_RATIONAL }

/**
 * The DISPLAYCONFIG_VIDEO_SIGNAL_INFO structure contains information about the video signal for a display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_video_signal_info
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_VIDEO_SIGNAL_INFO {
    #StructPack 8


    struct _AdditionalSignalInfo {
        /**
         * This bitfield backs the following members:
         * - videoStandard
         * - vSyncFreqDivider
         * - reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        videoStandard {
            get => (this._bitfield >> 0) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
        }

        /**
         * @type {Integer}
         */
        vSyncFreqDivider {
            get => (this._bitfield >> 16) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 16) | (this._bitfield & ~(0x3F << 16))
        }

        /**
         * @type {Integer}
         */
        reserved {
            get => (this._bitfield >> 22) & 0x3FF
            set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
        }
    }

    /**
     * The pixel clock rate.
     */
    pixelRate : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_rational">DISPLAYCONFIG_RATIONAL</a> structure that represents horizontal sync.
     */
    hSyncFreq : DISPLAYCONFIG_RATIONAL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_rational">DISPLAYCONFIG_RATIONAL</a> structure that represents vertical sync.
     */
    vSyncFreq : DISPLAYCONFIG_RATIONAL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_2dregion">DISPLAYCONFIG_2DREGION</a> structure that specifies the width and height (in pixels) of the active portion of the video signal.
     */
    activeSize : DISPLAYCONFIG_2DREGION

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_2dregion">DISPLAYCONFIG_2DREGION</a> structure that specifies the width and height (in pixels) of the entire video signal.
     */
    totalSize : DISPLAYCONFIG_2DREGION

    AdditionalSignalInfo : DISPLAYCONFIG_VIDEO_SIGNAL_INFO._AdditionalSignalInfo

    /**
     * The scan-line ordering (for example, progressive or interlaced) of the video signal. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_scanline_ordering">DISPLAYCONFIG_SCANLINE_ORDERING</a> enumerated type.
     */
    scanLineOrdering : DISPLAYCONFIG_SCANLINE_ORDERING

    static __New() {
        DefineProp(this.Prototype, 'videoStandard', { type: UInt32, offset: 40 })
        this.DeleteProp("__New")
    }
}
