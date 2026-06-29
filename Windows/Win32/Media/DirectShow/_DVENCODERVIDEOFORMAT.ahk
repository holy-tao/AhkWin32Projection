#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the video standard (NTSC or PAL) for digital video (DV) encoding.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_dvencodervideoformat
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _DVENCODERVIDEOFORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * National Television Standards Committee (NTSC)
     * @type {Integer (Int32)}
     */
    static DVENCODERVIDEOFORMAT_NTSC => 2000

    /**
     * Phase Alternating Line (PAL)
     * @type {Integer (Int32)}
     */
    static DVENCODERVIDEOFORMAT_PAL => 2001
}
