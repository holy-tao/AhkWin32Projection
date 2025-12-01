#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_TIMECODE structure contains DVD timecode in hours, minutes, seconds, and frames.
 * @remarks
 * DVD timecode is binary coded decimal (BCD) encoded in the format 0xHhMmSsFf, where:
 * 
 * <ul>
 * <li>H is tens of hours</li>
 * <li>h is hours</li>
 * <li>M is tens of minutes</li>
 * <li>m is minutes</li>
 * <li>S is tens of seconds</li>
 * <li>s is seconds</li>
 * <li>F is tens of frames</li>
 * <li>f is frames</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_timecode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_TIMECODE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Hours1
     * - Hours10
     * - Minutes1
     * - Minutes10
     * - Seconds1
     * - Seconds10
     * - Frames1
     * - Frames10
     * - FrameRateCode
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hours.
     * @type {Integer}
     */
    Hours1 {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * Tens of hours.
     * @type {Integer}
     */
    Hours10 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * Minutes.
     * @type {Integer}
     */
    Minutes1 {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * Tens of minutes.
     * @type {Integer}
     */
    Minutes10 {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * Seconds.
     * @type {Integer}
     */
    Seconds1 {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * Tens of seconds.
     * @type {Integer}
     */
    Seconds10 {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * Frames.
     * @type {Integer}
     */
    Frames1 {
        get => (this._bitfield >> 24) & 0xF
        set => this._bitfield := ((value & 0xF) << 24) | (this._bitfield & ~(0xF << 24))
    }

    /**
     * Tens of frames.
     * @type {Integer}
     */
    Frames10 {
        get => (this._bitfield >> 28) & 0x3
        set => this._bitfield := ((value & 0x3) << 28) | (this._bitfield & ~(0x3 << 28))
    }

    /**
     * Frames per second dropped and not dropped as indicated by [DVD_FRAMERATE](/windows/desktop/api/strmif/ne-strmif-dvd_framerate).
     * @type {Integer}
     */
    FrameRateCode {
        get => (this._bitfield >> 30) & 0x3
        set => this._bitfield := ((value & 0x3) << 30) | (this._bitfield & ~(0x3 << 30))
    }
}
