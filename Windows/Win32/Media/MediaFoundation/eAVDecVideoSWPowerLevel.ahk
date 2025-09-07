#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the power-saving level of a video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideoswpowerlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoSWPowerLevel{

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
