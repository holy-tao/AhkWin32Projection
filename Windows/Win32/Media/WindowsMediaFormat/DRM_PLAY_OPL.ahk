#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS.ahk
#Include .\DRM_OPL_OUTPUT_IDS.ahk
#Include .\DRM_VIDEO_OUTPUT_PROTECTION_IDS.ahk

/**
 * The DRM_PLAY_OPL structure holds information about the output protection levels (OPL) specified in a license for play actions.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-drm_play_opl
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_PLAY_OPL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_minimum_output_protection_levels">DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS</a> structure containing the minimum OPL required to play content in different formats.
     * @type {DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS}
     */
    minOPL{
        get {
            if(!this.HasProp("__minOPL"))
                this.__minOPL := DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS(this.ptr + 0)
            return this.__minOPL
        }
    }

    /**
     * Reserved for future use.
     * @type {DRM_OPL_OUTPUT_IDS}
     */
    oplIdReserved{
        get {
            if(!this.HasProp("__oplIdReserved"))
                this.__oplIdReserved := DRM_OPL_OUTPUT_IDS(this.ptr + 16)
            return this.__oplIdReserved
        }
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids">DRM_VIDEO_OUTPUT_PROTECTION_IDS</a> structure containing the video output protection identifiers that apply to playback of the content.
     * @type {DRM_VIDEO_OUTPUT_PROTECTION_IDS}
     */
    vopi{
        get {
            if(!this.HasProp("__vopi"))
                this.__vopi := DRM_VIDEO_OUTPUT_PROTECTION_IDS(this.ptr + 32)
            return this.__vopi
        }
    }
}
