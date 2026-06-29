#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates an MPEG-2 video profile as specified in the MPEG-2 video standard (ISO13818-2).
 * @remarks
 * DVD video decoders should support <b>AM_MPEG2Profile_Simple</b> or <b>AM_MPEG2Profile_Main</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_mpeg2profile
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_MPEG2Profile {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Simple profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_Simple => 1

    /**
     * Main profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_Main => 2

    /**
     * Signal to Noise Ratio (SNR) scalable profile
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_SNRScalable => 3

    /**
     * Spatially scalable profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_SpatiallyScalable => 4

    /**
     * High profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_High => 5
}
