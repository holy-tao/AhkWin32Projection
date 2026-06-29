#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that are used to configure the Microsoft DirectShow enhanced video renderer (EVR) filter.
 * @see https://learn.microsoft.com/windows/win32/api/evr/ne-evr-evrfilterconfigprefs
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct EVRFilterConfigPrefs {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
