#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that are used to configure the Microsoft DirectShow enhanced video renderer (EVR) filter.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-evrfilterconfigprefs
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class EVRFilterConfigPrefs extends Win32Enum {

    /**
     * Enables dynamic adjustments to video quality during playback.
     * Native name: EVRFilterConfigPrefs_EnableQoS
     * @type {Integer (Int32)}
     */
    static EnableQoS => 1

    /**
     * The bitmask of valid flag values. This constant is not itself a valid flag.
     * Native name: EVRFilterConfigPrefs_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 1
}
