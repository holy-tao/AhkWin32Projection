#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_VIDEO_OUTPUT_PROTECTION_IDS structure holds an array of DRM_VIDEO_OUTPUT_PROTECTION structures.
 * @remarks
 * 
 * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-drm_video_output_protection_ids
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_VIDEO_OUTPUT_PROTECTION_IDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the array referenced by <b>rgVop</b>.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Address of an array of <b>DRM_VIDEO_OUTPUT_PROTECTION</b> structures.
     * @type {Pointer<DRM_OUTPUT_PROTECTION>}
     */
    rgVop {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
