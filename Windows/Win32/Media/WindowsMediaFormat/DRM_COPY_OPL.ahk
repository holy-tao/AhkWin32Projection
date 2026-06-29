#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRM_OPL_OUTPUT_IDS.ahk" { DRM_OPL_OUTPUT_IDS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DRM_COPY_OPL structure holds information about the output protection levels specified in a license for copy actions.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_copy_opl
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_COPY_OPL {
    #StructPack 8

    /**
     * Minimum output protection level for copy actions.
     */
    wMinimumCopyLevel : UInt16

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_opl_output_ids">DRM_OPL_OUTPUT_IDS</a> structure containing the identifiers of technologies to allow. This member is used for output technologies that are assigned OPLs lower than the minimum copy level, but to which the content may be copied.
     */
    oplIdIncludes : DRM_OPL_OUTPUT_IDS

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_opl_output_ids">DRM_OPL_OUTPUT_IDS</a> structure containing the output identifiers of technologies to restrict. This member is used for output technologies that are assigned OPLs that exceed the minimum copy level, but that the license issuer does not grant rights for copying to.
     */
    oplIdExcludes : DRM_OPL_OUTPUT_IDS

}
