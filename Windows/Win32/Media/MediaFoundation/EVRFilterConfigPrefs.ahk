#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that are used to configure the Microsoft DirectShow enhanced video renderer (EVR) filter.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-evrfilterconfigprefs
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class EVRFilterConfigPrefs extends Win32Enum{

    /**
     * Enables dynamic adjustments to video quality during playback.
     * @type {Integer (Int32)}
     */
    static EVRFilterConfigPrefs_EnableQoS => 1

    /**
     * The bitmask of valid flag values. This constant is not itself a valid flag.
     * @type {Integer (Int32)}
     */
    static EVRFilterConfigPrefs_Mask => 1
}
