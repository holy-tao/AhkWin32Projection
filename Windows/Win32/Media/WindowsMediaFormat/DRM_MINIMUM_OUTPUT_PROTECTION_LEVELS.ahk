#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS structure holds the minimum output protection levels (OPL) for playback of various types of content. A device must support the minimum OPL for a type of data to receive that type of data from the reader.
 * @remarks
 * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_minimum_output_protection_levels
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS {
    #StructPack 2

    /**
     * Minimum OPL required to receive compressed digital video.
     */
    wCompressedDigitalVideo : UInt16

    /**
     * Minimum OPL required to receive uncompressed digital video.
     */
    wUncompressedDigitalVideo : UInt16

    /**
     * Minimum OPL required to receive analog video.
     */
    wAnalogVideo : UInt16

    /**
     * Minimum OPL required to receive compressed digital audio.
     */
    wCompressedDigitalAudio : UInt16

    /**
     * Minimum OPL required to receive uncompressed digital audio.
     */
    wUncompressedDigitalAudio : UInt16

}
