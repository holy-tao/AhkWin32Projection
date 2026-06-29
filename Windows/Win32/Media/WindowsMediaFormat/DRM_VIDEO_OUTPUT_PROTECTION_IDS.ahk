#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRM_OUTPUT_PROTECTION.ahk" { DRM_OUTPUT_PROTECTION }

/**
 * The DRM_VIDEO_OUTPUT_PROTECTION_IDS structure holds an array of DRM_VIDEO_OUTPUT_PROTECTION structures.
 * @remarks
 * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_VIDEO_OUTPUT_PROTECTION_IDS {
    #StructPack 8

    /**
     * Number of elements in the array referenced by <b>rgVop</b>.
     */
    cEntries : UInt16

    /**
     * Address of an array of <b>DRM_VIDEO_OUTPUT_PROTECTION</b> structures.
     */
    rgVop : DRM_OUTPUT_PROTECTION.Ptr

}
