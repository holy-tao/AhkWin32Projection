#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_OPL_OUTPUT_IDS structure holds a number of output protection level (OPL) output identifiers.
 * @remarks
 * 
  * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_copy_opl">DRM_COPY_OPL</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structures to identify groups of output identifiers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-drm_opl_output_ids
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_OPL_OUTPUT_IDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of identifiers in the array referenced by <b>rgIds</b>.
     * @type {Integer}
     */
    cIds {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Address of an array of GUIDs. Each member of the array contains an OPL output identifier.
     * @type {Pointer<Guid>}
     */
    rgIds {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
