#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of files that are included in an import operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportimportmode
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportImportMode extends Win32Enum{

    /**
     * All files are imported.
     * @type {Integer (Int32)}
     */
    static ImportEverything => 0

    /**
     * Sidecar files are ignored.
     * @type {Integer (Int32)}
     */
    static IgnoreSidecars => 1

    /**
     * Sibling files are ignored.
     * @type {Integer (Int32)}
     */
    static IgnoreSiblings => 2

    /**
     * Sidecar files and sibling files are ignored.
     * @type {Integer (Int32)}
     */
    static IgnoreSidecarsAndSiblings => 3
}
