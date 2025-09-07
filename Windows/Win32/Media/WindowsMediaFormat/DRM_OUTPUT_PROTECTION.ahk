#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_VIDEO_OUTPUT_PROTECTION structure holds a video output technology identifier and the configuration data required by that technology.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids">DRM_VIDEO_OUTPUT_PROTECTION_IDS</a> structure contains an array of <b>DRM_VIDEO_OUTPUT_PROTECTION</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_output_protection
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_OUTPUT_PROTECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Technology identifier.
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Configuration data required by the technology identified by <b>guidId</b>.
     * @type {Integer}
     */
    bConfigData {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
