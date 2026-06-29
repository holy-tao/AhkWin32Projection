#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPStreamingType enumeration specifies the type of streaming media.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmpstreamingtype
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPStreamingType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unknown type.
     * @type {Integer (Int32)}
     */
    static wmpstUnknown => 0

    /**
     * The plug-in must return a URL for music content.
     * @type {Integer (Int32)}
     */
    static wmpstMusic => 1

    /**
     * The plug-in must return a URL for video content.
     * @type {Integer (Int32)}
     */
    static wmpstVideo => 2

    /**
     * The plug-in must return a URL for radio content.
     * @type {Integer (Int32)}
     */
    static wmpstRadio => 3
}
