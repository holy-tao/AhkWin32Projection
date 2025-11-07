#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether the DVD is authored to play at 25 or 30 frames per second.
 * @remarks
 * 
 * You must know the frame rate to interpret the frame count as time.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_framerate
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_FRAMERATE{

    /**
     * Twenty-five frames per second.
     * @type {Integer (Int32)}
     */
    static DVD_FPS_25 => 1

    /**
     * Exactly 30 frames per second.
     * @type {Integer (Int32)}
     */
    static DVD_FPS_30NonDrop => 3
}
