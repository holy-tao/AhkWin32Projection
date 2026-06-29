#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the power-saving level of a video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideoswpowerlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoSWPowerLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Optimize for battery life.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSWPowerLevel_BatteryLife => 0

    /**
     * Balanced power-saving profile.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSWPowerLevel_Balanced => 50

    /**
     * Optimize for video quality.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSWPowerLevel_VideoQuality => 100
}
