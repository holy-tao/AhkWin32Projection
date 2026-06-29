#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-msvidsinkstreams
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MSVidSinkStreams {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSink_Video => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSink_Audio => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSVidSink_Other => 4
}
