#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the MPEG-2 profile. This enumeration is used with the AVEncMPVProfile property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPVProfile {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The profile is not known.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_unknown => 0

    /**
     * Simple Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_Simple => 1

    /**
     * Main Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_Main => 2

    /**
     * High Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_High => 3

    /**
     * 4:2:2 Profile.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVProfile_422 => 4
}
