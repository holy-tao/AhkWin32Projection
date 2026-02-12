#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the access mode with which photos are imported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportaccessmode
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportAccessMode extends Win32Enum{

    /**
     * Photos are imported with read and write access.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 0

    /**
     * Photos are imported with read-only access.
     * @type {Integer (Int32)}
     */
    static ReadOnly => 1

    /**
     * Photos are imported with read and delete access.
     * @type {Integer (Int32)}
     */
    static ReadAndDelete => 2
}
