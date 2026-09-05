#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the length of a placeholder identifier.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_placeholder_id
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_PLACEHOLDER_ID extends Win32Enum {

    /**
     * The length of a placeholder identifier.
     * Native name: PRJ_PLACEHOLDER_ID_LENGTH
     * @type {Integer (Int32)}
     */
    static LENGTH => 128
}
