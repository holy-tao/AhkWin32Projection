#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRM_OPL_OUTPUT_IDS.ahk" { DRM_OPL_OUTPUT_IDS }
#Import ".\DRM_OUTPUT_PROTECTION.ahk" { DRM_OUTPUT_PROTECTION }
#Import ".\DRM_VIDEO_OUTPUT_PROTECTION_IDS.ahk" { DRM_VIDEO_OUTPUT_PROTECTION_IDS }
#Import ".\DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS.ahk" { DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DRM_PLAY_OPL structure holds information about the output protection levels (OPL) specified in a license for play actions.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_play_opl
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_PLAY_OPL {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_minimum_output_protection_levels">DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS</a> structure containing the minimum OPL required to play content in different formats.
     */
    minOPL : DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS

    /**
     * Reserved for future use.
     */
    oplIdReserved : DRM_OPL_OUTPUT_IDS

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids">DRM_VIDEO_OUTPUT_PROTECTION_IDS</a> structure containing the video output protection identifiers that apply to playback of the content.
     */
    vopi : DRM_VIDEO_OUTPUT_PROTECTION_IDS

}
