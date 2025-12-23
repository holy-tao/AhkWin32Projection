#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include .\DISPLAYCONFIG_2DREGION.ahk

/**
 * The DISPLAYCONFIG_VIDEO_SIGNAL_INFO structure contains information about the video signal for a display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_video_signal_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_VIDEO_SIGNAL_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The pixel clock rate.
     * @type {Integer}
     */
    pixelRate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_rational">DISPLAYCONFIG_RATIONAL</a> structure that represents horizontal sync.
     * @type {DISPLAYCONFIG_RATIONAL}
     */
    hSyncFreq{
        get {
            if(!this.HasProp("__hSyncFreq"))
                this.__hSyncFreq := DISPLAYCONFIG_RATIONAL(8, this)
            return this.__hSyncFreq
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_rational">DISPLAYCONFIG_RATIONAL</a> structure that represents vertical sync.
     * @type {DISPLAYCONFIG_RATIONAL}
     */
    vSyncFreq{
        get {
            if(!this.HasProp("__vSyncFreq"))
                this.__vSyncFreq := DISPLAYCONFIG_RATIONAL(16, this)
            return this.__vSyncFreq
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_2dregion">DISPLAYCONFIG_2DREGION</a> structure that specifies the width and height (in pixels) of the active portion of the video signal.
     * @type {DISPLAYCONFIG_2DREGION}
     */
    activeSize{
        get {
            if(!this.HasProp("__activeSize"))
                this.__activeSize := DISPLAYCONFIG_2DREGION(24, this)
            return this.__activeSize
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_2dregion">DISPLAYCONFIG_2DREGION</a> structure that specifies the width and height (in pixels) of the entire video signal.
     * @type {DISPLAYCONFIG_2DREGION}
     */
    totalSize{
        get {
            if(!this.HasProp("__totalSize"))
                this.__totalSize := DISPLAYCONFIG_2DREGION(32, this)
            return this.__totalSize
        }
    }

    class _AdditionalSignalInfo extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - videoStandard
         * - vSyncFreqDivider
         * - reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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
     * @type {_AdditionalSignalInfo}
     */
    AdditionalSignalInfo{
        get {
            if(!this.HasProp("__AdditionalSignalInfo"))
                this.__AdditionalSignalInfo := %this.__Class%._AdditionalSignalInfo(40, this)
            return this.__AdditionalSignalInfo
        }
    }

    /**
     * @type {Integer}
     */
    videoStandard {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The scan-line ordering (for example, progressive or interlaced) of the video signal. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_scanline_ordering">DISPLAYCONFIG_SCANLINE_ORDERING</a> enumerated type.
     * @type {Integer}
     */
    scanLineOrdering {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
