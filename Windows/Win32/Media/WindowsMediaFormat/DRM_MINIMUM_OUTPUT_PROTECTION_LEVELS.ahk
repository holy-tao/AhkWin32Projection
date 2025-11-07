#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS structure holds the minimum output protection levels (OPL) for playback of various types of content. A device must support the minimum OPL for a type of data to receive that type of data from the reader.
 * @remarks
 * 
 * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-drm_minimum_output_protection_levels
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * Minimum OPL required to receive compressed digital video.
     * @type {Integer}
     */
    wCompressedDigitalVideo {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Minimum OPL required to receive uncompressed digital video.
     * @type {Integer}
     */
    wUncompressedDigitalVideo {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Minimum OPL required to receive analog video.
     * @type {Integer}
     */
    wAnalogVideo {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Minimum OPL required to receive compressed digital audio.
     * @type {Integer}
     */
    wCompressedDigitalAudio {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Minimum OPL required to receive uncompressed digital audio.
     * @type {Integer}
     */
    wUncompressedDigitalAudio {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
