#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMPBurnFormat enumeration type defines the possible types of CDs for burning.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpburnformat
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPBurnFormat {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The CD being burned is an audio CD.
     * @type {Integer (Int32)}
     */
    static wmpbfAudioCD => 0

    /**
     * The CD being burned is a data CD.
     * @type {Integer (Int32)}
     */
    static wmpbfDataCD => 1
}
