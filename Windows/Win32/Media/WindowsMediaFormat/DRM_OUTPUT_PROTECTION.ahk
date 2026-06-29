#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DRM_VIDEO_OUTPUT_PROTECTION structure holds a video output technology identifier and the configuration data required by that technology.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids">DRM_VIDEO_OUTPUT_PROTECTION_IDS</a> structure contains an array of <b>DRM_VIDEO_OUTPUT_PROTECTION</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_output_protection
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_OUTPUT_PROTECTION {
    #StructPack 4

    /**
     * Technology identifier.
     */
    guidId : Guid

    /**
     * Configuration data required by the technology identified by <b>guidId</b>.
     */
    bConfigData : Int8

}
