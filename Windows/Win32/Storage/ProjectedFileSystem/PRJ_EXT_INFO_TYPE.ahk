#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies extended information types
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ne-projectedfslib-prj_ext_info_type
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_EXT_INFO_TYPE{

    /**
     * This <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_extended_info">PRJ_EXTENDED_INFO</a> specifies the target of a symbolic link.
     * @type {Integer (Int32)}
     */
    static PRJ_EXT_INFO_TYPE_SYMLINK => 1
}
