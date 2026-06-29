#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DRM_OPL_OUTPUT_IDS structure holds a number of output protection level (OPL) output identifiers.
 * @remarks
 * This structure is used as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_copy_opl">DRM_COPY_OPL</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structures to identify groups of output identifiers.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_opl_output_ids
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_OPL_OUTPUT_IDS {
    #StructPack 8

    /**
     * Number of identifiers in the array referenced by <b>rgIds</b>.
     */
    cIds : UInt16

    /**
     * Address of an array of GUIDs. Each member of the array contains an OPL output identifier.
     */
    rgIds : Guid.Ptr

}
