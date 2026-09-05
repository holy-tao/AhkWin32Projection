#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the power-saving level of a video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideoswpowerlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoSWPowerLevel extends Win32Enum {

    /**
     * Optimize for battery life.
     * Native name: eAVDecVideoSWPowerLevel_BatteryLife
     * @type {Integer (Int32)}
     */
    static BatteryLife => 0

    /**
     * Balanced power-saving profile.
     * Native name: eAVDecVideoSWPowerLevel_Balanced
     * @type {Integer (Int32)}
     */
    static Balanced => 50

    /**
     * Optimize for video quality.
     * Native name: eAVDecVideoSWPowerLevel_VideoQuality
     * @type {Integer (Int32)}
     */
    static VideoQuality => 100
}
