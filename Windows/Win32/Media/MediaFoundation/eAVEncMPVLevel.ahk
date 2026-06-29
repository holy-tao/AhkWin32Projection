#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVLevel property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPVLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Low Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_Low => 1

    /**
     * Main Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_Main => 2

    /**
     * High 1440 Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_High1440 => 3

    /**
     * High Level.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVLevel_High => 4
}
