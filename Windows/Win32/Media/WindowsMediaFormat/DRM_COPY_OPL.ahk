#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRM_OPL_OUTPUT_IDS.ahk

/**
 * The DRM_COPY_OPL structure holds information about the output protection levels specified in a license for copy actions.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_copy_opl
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_COPY_OPL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Minimum output protection level for copy actions.
     * @type {Integer}
     */
    wMinimumCopyLevel {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_opl_output_ids">DRM_OPL_OUTPUT_IDS</a> structure containing the identifiers of technologies to allow. This member is used for output technologies that are assigned OPLs lower than the minimum copy level, but to which the content may be copied.
     * @type {DRM_OPL_OUTPUT_IDS}
     */
    oplIdIncludes{
        get {
            if(!this.HasProp("__oplIdIncludes"))
                this.__oplIdIncludes := DRM_OPL_OUTPUT_IDS(this.ptr + 8)
            return this.__oplIdIncludes
        }
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_opl_output_ids">DRM_OPL_OUTPUT_IDS</a> structure containing the output identifiers of technologies to restrict. This member is used for output technologies that are assigned OPLs that exceed the minimum copy level, but that the license issuer does not grant rights for copying to.
     * @type {DRM_OPL_OUTPUT_IDS}
     */
    oplIdExcludes{
        get {
            if(!this.HasProp("__oplIdExcludes"))
                this.__oplIdExcludes := DRM_OPL_OUTPUT_IDS(this.ptr + 24)
            return this.__oplIdExcludes
        }
    }
}
